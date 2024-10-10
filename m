Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD78CFD30C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53262.1728588944704958677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U9qA4zi3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QqfBIdFk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277eeca62-13f3c8fc-328f-4610-8810-646a0426574d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o7O0VPgRTS/CO5wFURzqONmiFEf6Zc7970KpbmVhiZQ=;
	b=U9qA4zi3EDAGKNHqI447HcroXnfFSZb2OtTf6QM+BJE9s81EcGhWDR1tQsAKOBS+
	IQo3mjBpiwDk41W5DIJPejS2gQ65jljCvGC6iRDlahhjTAoAFJDk0bsKPWUfAD7maTt
	1oEhRhcGkma9bXqpET+4f7v6Pnuo37pWgTNvftGs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o7O0VPgRTS/CO5wFURzqONmiFEf6Zc7970KpbmVhiZQ=;
	b=QqfBIdFkUGdcBM0OkYqHnvmAVGRkaF+uMwJvDRyohROL+CIKcU8CdRmKCJc6RySJ
	sOSl3VGdA2glhskUlRd3FeJKtlPk8ZOx5XTQKiOsfmsgG7MbH0h+8+oST1JNbYQ97QV
	007JUBiytpbZqqIJ+buPN/BuvrIkqB1dUuOlMPbA=
Content-Type: multipart/mixed; boundary="===============2989634624517369246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.1.0 SUCCEEDED
Message-ID: <0101019277eeca62-13f3c8fc-328f-4610-8810-646a0426574d-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205595

--===============2989634624517369246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.10-10.1.0.patch
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
From 73009ccf47d1260b70b36fe8d73a844ffea1a60c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 00:32:46 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.10 -> 10.1.0

---
 .../dhcpcd/{dhcpcd_10.0.10.bb => dhcpcd_10.1.0.bb}           | 2 +-
 ...0-resolv.conf-improve-the-sitation-of-working-with-.patch | 5 +----
 ...01-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 2 +-
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch     | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.10.bb => dhcpcd_10.1.0.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
index 0ae9db911c..3f806bb187 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "ab5ec18e755c1bb450c74d3a4657ea48d0f7f314"
+SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..3a8a445288 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From 87c3561eb614f9569d417e1de679d18a72976d58 Mon Sep 17 00:00:00 2001
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
index b958110ef1..037707f391 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
+From a52af5eb5fb4d92ce58b9864d34d6bd751086df1 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 8890c2d7dc..d498b96e2e 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
+From eed2cdcf1069d969b97b439e0bb83b04af043ced Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
-- 
2.44.1


--===============2989634624517369246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1212088 to 1208424 (-0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1107881 to 1100832 (-1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.10 [default] to 10.1.0 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.0.10" to "10.1.0"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.0.10 [default] to 10.1.0 [default]

--===============2989634624517369246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.10-10.1.0.patch"

RnJvbSA3MzAwOWNjZjQ3ZDEyNjBiNzBiMzZmZThkNzNhODQ0ZmZlYTFhNjBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDA6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMC4xMCAtPiAxMC4xLjAKCi0tLQogLi4uL2RoY3BjZC97ZGhjcGNk
XzEwLjAuMTAuYmIgPT4gZGhjcGNkXzEwLjEuMC5iYn0gICAgICAgICAgIHwgMiArLQogLi4uMC1y
ZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIHwg
NSArLS0tLQogLi4uMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11
bHRpbGliLnBhdGNoIHwgMiArLQogLi4uLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVu
dC1idWlsZC1pc3N1ZXMucGF0Y2ggICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2Qve2RoY3BjZF8xMC4wLjEwLmJiID0+IGRoY3BjZF8xMC4xLjAuYmJ9ICg5NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAu
MTAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL2RoY3BjZF8xMC4wLjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMS4wLmJiCmluZGV4IDBhZTlkYjkxMWMuLjNmODA2YmIx
ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4wLjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4xLjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05l
dHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxl
LW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiYWI1ZWMxOGU3NTVj
MWJiNDUwYzc0ZDNhNDY1N2VhNDhkMGY3ZjMxNCIKK1NSQ1JFViA9ICI1N2MzNTA2YTU2MjJlMTk5
Y2YwZTNmYzFlZjI2YTcxY2RlZGM5NTIxIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJp
dCBwa2djb25maWcgYXV0b3Rvb2xzLWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2
LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1w
cm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaAppbmRleCA4ZDFlZDY2NzFh
Li4zYThhNDQ1Mjg4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLTIwLXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtp
bmctd2l0aC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmls
ZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdp
dGgtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMmFjYzRkODc1ZWU4MWU2ZmQxOWVmNjZk
NjljOWY1NWI0YjRhN2U3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4N2MzNTYxZWI2
MTRmOTU2OWQ0MTdlMWRlNjc5ZDE4YTcyOTc2ZDU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAy
MDIyIDE2OjMzOjE4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXBy
b3ZlIHRoZSBzaXRhdGlvbiBvZiB3b3JraW5nIHdpdGggc3lzdGVtZApAQCAtNzcsNiArNzcsMyBA
QCBpbmRleCA3YzI5ZTI3Ni4uYmVjYzAxOWYgMTAwNjQ0CiAgCQkiJHJlc29sdmNvbmYiIC1kICIk
aWZuYW1lIiAtZgogIAllbHNlCiAgCQlpZiBbIC1lICIkcmVzb2x2X2NvbmZfZGlyLyRpZm5hbWUi
IF07IHRoZW4KLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4t
ZW5hYmxlLW11bHRpbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGls
aWIucGF0Y2gKaW5kZXggYjk1ODExMGVmMS4uMDM3NzA3ZjM5MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxp
Y3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3It
d2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDExMTU3ODRk
ZmRmMmU3MDk1Y2Y1OTlmOWJlY2VmNzA1YWM1N2Y4MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGE1MmFmNWViNWZiNGQ5MmNlNThiOTg2NGQzNGQ2YmQ3NTEwODZkZjEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
CiBEYXRlOiBGcmksIDEwIE1hciAyMDIzIDAzOjQ4OjQ2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGRoY3BjZC44OiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92
ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2
ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaAppbmRleCA4ODkwYzJkN2RjLi5kNDk4Yjk2ZTJlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92
ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8t
cHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY5YmFiZWYz
M2IwZWU0YzYwZDg4MjE3OTc3NzdiOWFmZmVkZDQ3ZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGVlZDJjZGNmMTA2OWQ5NjliOTdiNDM5ZTBiYjgzYjA0YWYwNDNjZWQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBTdGVmYW5vIENhcHBhIDxzdGVmYW5vLmNhcHBhLmtzODlA
Z21haWwuY29tPgogRGF0ZTogU3VuLCAxMyBKYW4gMjAxOSAwMTo1MDo1MiArMDEwMAogU3ViamVj
dDogW1BBVENIXSByZW1vdmUgSU5DTFVERURJUiB0byBwcmV2ZW50IGJ1aWxkIGlzc3VlcwotLSAK
Mi40NC4xCgo=

--===============2989634624517369246==--

