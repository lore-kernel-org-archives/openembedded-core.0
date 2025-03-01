Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD53C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7163.1740828318538724398
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G0iXw7jN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SaLDsTLA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195517417fa-1ad9d2c3-1fd2-4b27-ab27-5fbf57b6f5df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BLnJ/WNO2Lzbr1tEfev6pyqeRG2GIdQ3sHWa1xUjsLY=;
	b=G0iXw7jNFv5ks2dD0bxGVtjPsD5PopMFZqnRfhKgg6FwfPOuWQg76We6pombfDYF
	7TUfVRiFPl9LfjseRjytjHve6TdWO59CbI26Z0jeAbhJ6jo+qPKWz9jq15T5XNASszn
	EgdYVxWsz7hqSur9JpOPT3ztUL2TLDENO14p+uVA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BLnJ/WNO2Lzbr1tEfev6pyqeRG2GIdQ3sHWa1xUjsLY=;
	b=SaLDsTLAv9ff1So+XLS0XMeg9SWFDnTFQGcR6WKn8YpqN+6Fgh3BRej6LuotRqXH
	BMZsS1GlIY6ukn0W6/yNuCK9+it/T9scdliROYUNZYbZ0lVPEuAh3dgU06FafTKtvg8
	CgbUT/NERxRxq7IBqqyieJUsq33fBAe71sj6CCCM=
Content-Type: multipart/mixed; boundary="===============8107776054656860515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.2.2 SUCCEEDED
Message-ID: <01010195517417fa-1ad9d2c3-1fd2-4b27-ab27-5fbf57b6f5df-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212101

--===============8107776054656860515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.1.0-10.2.2.patch
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
From 5c46cfdd0b3cf88c131b159e198fa713028ad8aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 06:40:56 +0000
Subject: [PATCH] dhcpcd: upgrade 10.1.0 -> 10.2.2

---
 .../{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb}    | 23 +++++++++++++++++--
 ...mprove-the-sitation-of-working-with-.patch |  5 +---
 ...-conflict-error-when-enable-multilib.patch |  4 ++--
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb} (73%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
similarity index 73%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
index 3f806bb187..4d123d6208 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2006-2024 Roy Marples <roy@marples.name>
+# +Copyright (c) 2006-2025 Roy Marples <roy@marples.name>
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SECTION = "console/network"
 SUMMARY = "dhcpcd - a DHCP client"
 DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
@@ -7,7 +26,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -17,7 +36,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..8d9d528019 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From 3e5214f14ada88bd27bb372f484519780019a8d1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -77,6 +77,3 @@ index 7c29e276..becc019f 100644
  		"$resolvconf" -d "$ifname" -f
  	else
  		if [ -e "$resolv_conf_dir/$ifname" ]; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index b958110ef1..59184ed950 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
+From c2ddea4d58b2eedd082aa61c75ab359f1ee008aa Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 04bf7d90..9cf10d24 100644
+index 91fdde2c..b467dc3b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 8890c2d7dc..62634e0fe9 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
+From dff30e7b5a9bf71424361ae961a2a76c7d0cb570 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 1a772b02..0f915b39 100755
+index a60da137..3673de8b 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.44.1


--===============8107776054656860515==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.1.0-10.2.2.patch"

RnJvbSA1YzQ2Y2ZkZDBiM2NmODhjMTMxYjE1OWUxOThmYTcxMzAyOGFkOGFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNjo0MDo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4xLjAgLT4gMTAuMi4yCgotLS0KIC4uLi97ZGhjcGNkXzEwLjEuMC5i
YiA9PiBkaGNwY2RfMTAuMi4yLmJifSAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KIC4uLm1w
cm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8ICA1ICstLS0KIC4uLi1j
b25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCB8ICA0ICsrLS0KIC4uLmUt
SU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaCB8ICA0ICsrLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qve2RoY3BjZF8xMC4xLjAuYmIgPT4gZGhjcGNk
XzEwLjIuMi5iYn0gKDczJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2RoY3BjZC9kaGNwY2RfMTAuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNw
Y2QvZGhjcGNkXzEwLjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDczJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMi4yLmJiCmluZGV4IDNm
ODA2YmIxODcuLjRkMTIzZDYyMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL2RoY3BjZF8xMC4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZGhjcGNkXzEwLjIuMi5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNv
cHlyaWdodCAoYykgMjAwNi0yMDI0IFJveSBNYXJwbGVzIDxyb3lAbWFycGxlcy5uYW1lPgorIyAr
Q29weXJpZ2h0IChjKSAyMDA2LTIwMjUgUm95IE1hcnBsZXMgPHJveUBtYXJwbGVzLm5hbWU+Cisj
ICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGlu
IHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisKIFNFQ1RJ
T04gPSAiY29uc29sZS9uZXR3b3JrIgogU1VNTUFSWSA9ICJkaGNwY2QgLSBhIERIQ1AgY2xpZW50
IgogREVTQ1JJUFRJT04gPSAiZGhjcGNkIHJ1bnMgb24geW91ciBtYWNoaW5lIGFuZCBzaWxlbnRs
eSBjb25maWd1cmVzIHlvdXIgXApAQCAtNyw3ICsyNiw3IEBAIERFU0NSSVBUSU9OID0gImRoY3Bj
ZCBydW5zIG9uIHlvdXIgbWFjaGluZSBhbmQgc2lsZW50bHkgY29uZmlndXJlcyB5b3VyIFwKIEhP
TUVQQUdFID0gImh0dHA6Ly9yb3kubWFycGxlcy5uYW1lL3Byb2plY3RzL2RoY3BjZC8iCiAKIExJ
Q0VOU0UgPSAiQlNELTItQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9ZDI5NmM0YmVjMzA2ZjM1MWU2NzY3MDVhYWYyMzdjOGMiCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT00ZGRhNWJlYjQzM2E4MDlmMmUwYWVmZmJmOWRhM2Q5MSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9uL2RoY3Bj
ZDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
cmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2ggXApAQCAtMTcs
NyArMzYsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTmV0d29ya0NvbmZpZ3VyYXRp
b24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICBmaWxlOi8vMDAw
MS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI1N2MzNTA2YTU2MjJlMTk5Y2YwZTNmYzFlZjI2
YTcxY2RlZGM5NTIxIgorU1JDUkVWID0gImY2OTgzYzE4ZGJmNzk4OWY0M2EyODM4YmVlYWY2MmE1
NGM1M2ZmMWQiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0IHBrZ2NvbmZpZyBhdXRv
dG9vbHMtYnJva2Vuc2VwIHN5c3RlbWQgdXNlcmFkZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRo
ZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlv
bi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCmluZGV4IDhkMWVkNjY3MWEuLjhkOWQ1MjgwMTkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAt
cmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29s
di5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDAyYWNjNGQ4NzVlZTgxZTZmZDE5ZWY2NmQ2OWM5ZjU1YjRiNGE3ZTcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNlNTIxNGYxNGFkYTg4YmQyN2JiMzcyZjQ4
NDUxOTc4MDAxOWE4ZDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxR
aS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDkgTm92IDIwMjIgMTY6MzM6MTggKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gMjAtcmVzb2x2LmNvbmY6IGltcHJvdmUgdGhlIHNpdGF0aW9u
IG9mIHdvcmtpbmcgd2l0aCBzeXN0ZW1kCkBAIC03Nyw2ICs3NywzIEBAIGluZGV4IDdjMjllMjc2
Li5iZWNjMDE5ZiAxMDA2NDQKICAJCSIkcmVzb2x2Y29uZiIgLWQgIiRpZm5hbWUiIC1mCiAgCWVs
c2UKICAJCWlmIFsgLWUgIiRyZXNvbHZfY29uZl9kaXIvJGlmbmFtZSIgXTsgdGhlbgotLS0gCi0y
LjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmls
ZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3Bj
ZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaAppbmRleCBi
OTU4MTEwZWYxLi41OTE4NGVkOTUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVu
YWJsZS1tdWx0aWxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0
aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTExNTc4NGRmZGYyZTcwOTVjZjU5OWY5
YmVjZWY3MDVhYzU3ZjgwZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzJkZGVhNGQ1
OGIyZWVkZDA4MmFhNjFjNzVhYjM1OWYxZWUwMDhhYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4KIERhdGU6IEZyaSwgMTAg
TWFyIDIwMjMgMDM6NDg6NDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZGhjcGNkLjg6IEZpeCBj
b25mbGljdCBlcnJvciB3aGVuIGVuYWJsZSBtdWx0aWxpYi4KQEAgLTI5LDcgKzI5LDcgQEAgU2ln
bmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2RoY3BjZC44LmluIGIvc3JjL2RoY3BjZC44LmluCi1pbmRleCAwNGJmN2Q5MC4uOWNmMTBkMjQg
MTAwNjQ0CitpbmRleCA5MWZkZGUyYy4uYjQ2N2RjM2IgMTAwNjQ0CiAtLS0gYS9zcmMvZGhjcGNk
LjguaW4KICsrKyBiL3NyYy9kaGNwY2QuOC5pbgogQEAgLTgyNiw3ICs4MjYsNyBAQCBDb25maWd1
cmF0aW9uIGZpbGUgZm9yIGRoY3BjZC4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWls
ZC1pc3N1ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8w
MDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoCmluZGV4
IDg4OTBjMmQ3ZGMuLjYyNjM0ZTBmZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWls
ZC1pc3N1ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmls
ZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNjliYWJlZjMzYjBlZTRjNjBkODgyMTc5Nzc3N2I5YWZmZWRk
NDdkYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGZmMzBlN2I1YTliZjcxNDI0MzYx
YWU5NjFhMmE3NmM3ZDBjYjU3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0ZWZh
bm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDEzIEph
biAyMDE5IDAxOjUwOjUyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBJTkNMVURFRElS
IHRvIHByZXZlbnQgYnVpbGQgaXNzdWVzCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6
IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEua3M4OUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1
cmUKLWluZGV4IDFhNzcyYjAyLi4wZjkxNWIzOSAxMDA3NTUKK2luZGV4IGE2MGRhMTM3Li4zNjcz
ZGU4YiAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJlCiBAQCAtMjYsNyAr
MjYsNiBAQCBCVUlMRD0KLS0gCjIuNDQuMQoK

--===============8107776054656860515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1308736 to 1336424 (+2%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 65175 to 66983 (+3%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1100832 to 1117821 (+2%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 432552 to 436664 (+1%)
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.2 [default]

--===============8107776054656860515==--

