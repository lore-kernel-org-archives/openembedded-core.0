Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ABECD1298
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.44901.1711995070832111360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GCsNE4ow;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2OGVtEXa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9adbac4c-5319b436-cdcc-43fa-a046-3ae646083148-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eD8cE9lHRHkN8z7c12g1+OMQ6kuXv76T4U5CDBEieLI=;
	b=GCsNE4owxHV2pdGoEVCGB/8yrzYyAEQOT0nLh4VD2s/rTlAsQrKM/3mnCCQK/oDd
	qbF5xSFJ4nifcoPfssfq6ykb9WgFrJE/YiyBALnttBLMfYVvVhxGgqOv8S1wpiiyffa
	gV1gO2jp+tEQni5syVpc9hqy/bJVNCZGa17kBUN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eD8cE9lHRHkN8z7c12g1+OMQ6kuXv76T4U5CDBEieLI=;
	b=2OGVtEXadqbhvxt0trFBxargcyfXFy66YA3D8mkN8tFNCq4IH3nNMXli8E3BTf2D
	A00MeoyPoHjhOdP0N2t+DCvy0JadRnFE00GJab8q6RzDHE8Ya5JBi7NxyjyEIwtHjh7
	1pvkmWiZlrm7ptsiaSA6mYwtk8BxtmxiLNlRSi7I=
Content-Type: multipart/mixed; boundary="===============3672373644031687577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.5 SUCCEEDED
Message-ID: <0101018e9adbac4c-5319b436-cdcc-43fa-a046-3ae646083148-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197845

--===============3672373644031687577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.4-2.4.5.patch
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
From 179b0ce95beec378e696359323e5d69e2241770a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:59:15 +0000
Subject: [PATCH] gnupg: upgrade 2.4.4 -> 2.4.5

---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch     | 7 ++-----
 ...figure.ac-use-a-custom-value-for-the-location-of-.patch | 5 ++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch  | 3 +--
 ...004-autogen.sh-fix-find-version-for-beta-checking.patch | 3 +--
 meta/recipes-support/gnupg/gnupg/relocate.patch            | 3 +--
 .../gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb}               | 2 +-
 6 files changed, 8 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..1370e78e61 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From e66cfc77e8517e1bafeada5965336428693033af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..e2f90f65a3 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From 43ea44d2162b62dbe0b97a91d45ab04cfacfd714 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,13 +8,12 @@ This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index ac4f08c..90f77e9 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..e8e4692047 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From dc2c180992abed1d80cdf9b5c67eade3325feacf Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..d35acf5e4e 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From 41ac986be1f73b62ebb99243c1078ed674b3a100 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,7 +13,6 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026a..405bde78e5 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 9a3bbbf2d101131728a8e0c8f5928d002103c132 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,7 +8,6 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.5.bb
index fff7d8c6da..99996968b1 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
+SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.42.0


--===============3672373644031687577==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.4-2.4.5.patch"

RnJvbSAxNzliMGNlOTViZWVjMzc4ZTY5NjM1OTMyM2U1ZDY5ZTIyNDE3NzBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjo1OToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNC40IC0+IDIuNC41CgotLS0KIC4uLi8wMDAxLVdvdmVycmlkZS1pbml0
LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCAgICAgfCA3ICsrLS0tLS0KIC4uLmZpZ3Vy
ZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggfCA1ICsr
LS0tCiAuLi4vZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcu
cGF0Y2ggIHwgMyArLS0KIC4uLjAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJl
dGEtY2hlY2tpbmcucGF0Y2ggfCAzICstLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGcvcmVsb2NhdGUucGF0Y2ggICAgICAgICAgICB8IDMgKy0tCiAuLi4vZ251cGcve2dudXBnXzIu
NC40LmJiID0+IGdudXBnXzIuNC41LmJifSAgICAgICAgICAgICAgIHwgMiArLQogNiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL3tnbnVwZ18yLjQuNC5iYiA9PiBnbnVwZ18yLjQuNS5iYn0gKDk3
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdv
dmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13
aXRoLWdjYy05LnBhdGNoCmluZGV4IDgzMTk1YjViZDQuLjEzNzBlNzhlNjEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMt
bm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlM2FkYzgxNmQyZDU2ZGQ5MjkwMTYwNzM5MzdiYTI0
ZTAxZTAzY2I4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNjZjZmM3N2U4NTE3ZTFi
YWZlYWRhNTk2NTMzNjQyODY5MzAzM2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgRGVjIDIwMTggMTc6
Mzc6NDggLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gV292ZXJyaWRlLWluaXQgaXMgbm90IG5lZWRl
ZCB3aXRoIGdjYyA5CkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kaXJtbmdyL2Rucy5oIGIvZGlybW5nci9kbnMuaAot
aW5kZXggMDI0ZDZkY2M4Li5jNmUxNDFlMTYgMTAwNjQ0CitpbmRleCAxZjY0N2UxLi4zMzRhY2I2
IDEwMDY0NAogLS0tIGEvZGlybW5nci9kbnMuaAogKysrIGIvZGlybW5nci9kbnMuaAogQEAgLTEz
OSw3ICsxMzksNyBAQCBETlNfUFVCTElDIGludCAqZG5zX2RlYnVnX3Aodm9pZCk7CkBAIC0yOSw2
ICsyOSwzIEBAIGluZGV4IDAyNGQ2ZGNjOC4uYzZlMTQxZTE2IDEwMDY0NAogICNkZWZpbmUgRE5T
X1BSQUdNQV9QVVNIIF9QcmFnbWEoIkdDQyBkaWFnbm9zdGljIHB1c2giKQogICNkZWZpbmUgRE5T
X1BSQUdNQV9RVUlFVCBfUHJhZ21hKCJHQ0MgZGlhZ25vc3RpYyBpZ25vcmVkIFwiLVdvdmVycmlk
ZS1pbml0XCIiKQogICNkZWZpbmUgRE5TX1BSQUdNQV9QT1AgX1ByYWdtYSgiR0NDIGRpYWdub3N0
aWMgcG9wIikKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhl
LWxvY2F0aW9uLW9mLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAw
MDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5w
YXRjaAppbmRleCBmOTU3ZjZiNTVlLi5lMmY5MGY2NWEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFs
dWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUt
bG9jYXRpb24tb2YtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YjU4MWM0M2JkMDFmODE1
ZGI3OGE0MTBmZDM4MTRmYzU5OTQxNzFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0
M2VhNDRkMjE2MmI2MmRiZTBiOTdhOTFkNDVhYjA0Y2ZhY2ZkNzE0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBNb24sIDIyIEphbiAyMDE4IDE4OjAwOjIxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGNvbmZpZ3VyZS5hYzogdXNlIGEgY3VzdG9tIHZhbHVlIGZvciB0aGUgbG9jYXRpb24gb2YKQEAg
LTgsMTMgKzgsMTIgQEAgVGhpcyBzaG91bGQgYXZvaWQgY2xhc2hlcyB3aXRoIHRoZSBob3N0IGdw
Zy1hZ2VudCBvYnNlcnZlZCBvbiBhdXRvYnVpbGRlcnMuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpYywgYW5kIG9ubHkgZm9yIC1uYXRpdmVdCiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQog
LS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCi1pbmRleCAyNmQ3ZjdiLi5lOTUzYzJlIDEwMDY0NAoraW5kZXggYWM0ZjA4Yy4uOTBmNzdl
OSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMTky
MSw3ICsxOTIxLDcgQEAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BH
Q29uZiIsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAy
LXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgt
Y29uZmlnLnBhdGNoCmluZGV4IDBlNThmZDRjNGQuLmU4ZTQ2OTIwNDcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFk
LW9mLW5wdGgtY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBkOTA0ODc4OGQ5MDY3NzRiMTQ3NWMzYmIxYjE3ZTIyNDU1YzJhZGQ0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYzJjMTgwOTkyYWJlZDFkODBjZGY5YjVj
NjdlYWRlMzMyNWZlYWNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xk
IDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxNiBBdWcgMjAxNyAxMToxNjozMCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSB1c2UgcGtnY29uZmlnIGluc3RlYWQgb2YgbnB0aCBjb25m
aWcKQEAgLTksNyArOSw2IEBAIFNpZ25lZC1vZmYtYnk6IFNhdWwgV29sZCA8c2d3QGxpbnV4Lmlu
dGVsLmNvbT4KIAogUmViYXNlIHRvIDIuMS4yMwogU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8
aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgotCiAtLS0KICBtNC9ucHRoLm00IHwgNTMgKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12
ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tp
bmcucGF0Y2gKaW5kZXggZDY2NGMzNmExYi4uZDM1YWNmNWU0ZSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNp
b24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tp
bmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZhN2Y5YjcxZDkzNjg0N2RjYWVlYWM3ZDFi
NjlkODI5OWJlNGRkODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQxYWM5ODZiZTFm
NzNiNjJlYmI5OTI0M2MxMDc4ZWQ2NzRiM2ExMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBXZW56b25nIEZhbiA8d2Vuem9uZy5mYW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwg
MTYgQXVnIDIwMTcgMTE6MjM6MjIgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXV0b2dlbi5zaDog
Zml4IGZpbmQtdmVyc2lvbiBmb3IgYmV0YSBjaGVja2luZwpAQCAtMTMsNyArMTMsNiBAQCBTaWdu
ZWQtb2ZmLWJ5OiBXZW56b25nIEZhbiA8d2Vuem9uZy5mYW5Ad2luZHJpdmVyLmNvbT4KIAogUmVi
YXNlIHRvIDIuMS4yMwogU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5k
cml2ZXIuY29tPgotCiAtLS0KICBhdXRvZ2VuLnNoIHwgMSAtCiAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
L3JlbG9jYXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2Nh
dGUucGF0Y2gKaW5kZXggZWEwMjUyMDI2YS4uNDA1YmRlNzhlNSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGM1MGQwYTk1ZmNmOGY5NmMyNzJmYWRkNGJhODVmM2VlYWMzOWZjYWYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDlhM2JiYmYyZDEwMTEzMTcyOGE4ZTBjOGY1OTI4ZDAwMjEwM2Mx
MzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxNDo0NDo0MCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBBbGxvdyB0aGUgZW52aXJvbm1lbnQgdG8gb3ZlcnJpZGUgd2hlcmUgZ251
cGcgbG9va3MgZm9yIGl0cwpAQCAtOCw3ICs4LDYgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtPRS1zcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+CiAKIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+Ci0KIC0tLQogIGNvbW1vbi9ob21lZGlyLmMgfCAxNCArKysrKysrLS0t
LS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNC5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC41LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNS5iYgppbmRl
eCBmZmY3ZDhjNmRhLi45OTk5Njk2OGIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZ18yLjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZ18yLjQuNS5iYgpAQCAtMjMsNyArMjMsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcmVsb2NhdGUucGF0Y2giCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY3ZWJlMDE2Y2E5MGZhNzY4OGNlNjdhMzg3ZWJkODJj
NjI2MWU5NTg5N2RiN2IyM2RmMjRmZjMzNWJlODViYzYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZjY4ZjdkNzVkMDZjYjE2MzVjMzM2ZDM0ZDg0NGFmOTc0MzZjM2Y2NGVhMTRiY2I3Yzg2OTc4MmY5
NmY0NDI3NyIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1sZGFwIFwKIAkJLS1kaXNhYmxl
LWNjaWQtZHJpdmVyIFwKLS0gCjIuNDIuMAoK

--===============3672373644031687577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 20025304 to 20050800 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1192073 to 1197789 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1591348 to 1591412 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGSIZE changed from 43079 to 43010 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 242046 to 241869 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGSIZE changed from 131289 to 131114 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 245737 to 245682 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGSIZE changed from 56980 to 56832 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 223900 to 223838 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 221524 to 221462 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGSIZE changed from 28129 to 28068 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGSIZE changed from 214798 to 214598 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGSIZE changed from 41307 to 41196 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGSIZE changed from 42844 to 42743 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 201025 to 200784 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGSIZE changed from 42748 to 42679 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGSIZE changed from 44209 to 44132 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGSIZE changed from 41136 to 41028 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 235749 to 235558 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 252952 to 252874 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGSIZE changed from 209933 to 209765 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 239518 to 244708 (+2%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 235642 to 235472 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGSIZE changed from 82627 to 82533 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGSIZE changed from 289694 to 289444 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGSIZE changed from 43728 to 43653 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGSIZE changed from 131585 to 131364 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 240902 to 240726 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGSIZE changed from 295138 to 294862 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 219889 to 219732 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 174337 to 174172 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 8838039 to 8853319 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg: PKGSIZE changed from 4631309 to 4639661 (+0%)
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.4.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.5.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-64-poky-linux/gnupg: PV changed from "2.4.4" to "2.4.5"

--===============3672373644031687577==--

