Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2798C021A6
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8091.1739623332163588576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BpIxe7Nk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P5lHZYiL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a175f4-bd70f722-4642-4536-acb2-14c25e6dd887-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eXD1A9ppjfUrESKCR01EIAaALn3dchejiqNmNkvnqRU=;
	b=BpIxe7NkcSYfxnaU49RtQDY50jDu0CGNVsiUZIoYqpEvwBmL67aItpWB0ApVahW0
	yQSyMLk1MTYztAdh2P9hL0UBZ4+b2vonqBOIG5RhKfw8lLLemT6WjBUPs13gJIXG3rV
	E0J0RqqWWV7kx8/SQQdLMy2DLcvRyckwdX8YuY18=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eXD1A9ppjfUrESKCR01EIAaALn3dchejiqNmNkvnqRU=;
	b=P5lHZYiL99j2uhHVPskhNPw2L0Cp+4e7f4+MDcxWO48pDzeHeRr6UZgTvapaXTbt
	CtrJxLkUoTmepJ5ihMFzHovG/coxAj8VCnYfkGf81BwBFv/ibM5/eNjX3iqblibqWgM
	7ugSLwZudMXoelATrbsafcx6nln8hY1mr4PaMYJE=
Content-Type: multipart/mixed; boundary="===============2333954422785071012=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.2.0 SUCCEEDED
Message-ID: <0101019509a175f4-bd70f722-4642-4536-acb2-14c25e6dd887-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211402

--===============2333954422785071012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.1.0-10.2.0.patch
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
From 7a5d29b9146fa196861c28ee9327adfc0756f09c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:22:19 +0000
Subject: [PATCH] dhcpcd: upgrade 10.1.0 -> 10.2.0

---
 .../dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.0.bb}            | 2 +-
 ...0-resolv.conf-improve-the-sitation-of-working-with-.patch | 5 +----
 ...01-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 2 +-
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch     | 4 ++--
 4 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.0.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.0.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.0.bb
index 3f806bb187..5bb1cadec8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "8beb42b62651f0a6647e6b83f3e50b8e32a1db69"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..88acb2f72f 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From ba32aab24462486cc9979932df636685e7ffb40f Mon Sep 17 00:00:00 2001
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
index b958110ef1..672867c8a3 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
+From 601e88e4b2b64a2fd812507682a16d49eba92bf3 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 8890c2d7dc..8a69452ff8 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
+From 70012f4507357522d69aacd4b19a6a7ed7cba0d3 Mon Sep 17 00:00:00 2001
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


--===============2333954422785071012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1308736 to 1334784 (+2%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 65175 to 66889 (+3%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1100832 to 1114883 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 432552 to 436664 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.1.0" to "10.2.0"

--===============2333954422785071012==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.1.0-10.2.0.patch"

RnJvbSA3YTVkMjliOTE0NmZhMTk2ODYxYzI4ZWU5MzI3YWRmYzA3NTZmMDljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6MjI6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMS4wIC0+IDEwLjIuMAoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMS4wLmJiID0+IGRoY3BjZF8xMC4yLjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAuLi4wLXJl
c29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2ggfCA1
ICstLS0tCiAuLi4wMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVs
dGlsaWIucGF0Y2ggfCAyICstCiAuLi4vMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50
LWJ1aWxkLWlzc3Vlcy5wYXRjaCAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL3tkaGNwY2RfMTAuMS4wLmJiID0+IGRoY3BjZF8xMC4yLjAuYmJ9ICg5NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjEu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4yLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kaGNwY2QvZGhjcGNkXzEwLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZGhjcGNkXzEwLjIuMC5iYgppbmRleCAzZjgwNmJiMTg3Li41YmIxY2FkZWM4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAu
MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4y
LjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05ldHdv
cmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11
bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiNTdjMzUwNmE1NjIyZTE5
OWNmMGUzZmMxZWYyNmE3MWNkZWRjOTUyMSIKK1NSQ1JFViA9ICI4YmViNDJiNjI2NTFmMGE2NjQ3
ZTZiODNmM2U1MGI4ZTMyYTFkYjY5IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBw
a2djb25maWcgYXV0b3Rvb2xzLWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNv
bmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92
ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaAppbmRleCA4ZDFlZDY2NzFhLi44
OGFjYjJmNzJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9m
aWxlcy8wMDAxLTIwLXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmct
d2l0aC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMv
MDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMmFjYzRkODc1ZWU4MWU2ZmQxOWVmNjZkNjlj
OWY1NWI0YjRhN2U3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYTMyYWFiMjQ0NjI0
ODZjYzk5Nzk5MzJkZjYzNjY4NWU3ZmZiNDBmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAyMDIy
IDE2OjMzOjE4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXByb3Zl
IHRoZSBzaXRhdGlvbiBvZiB3b3JraW5nIHdpdGggc3lzdGVtZApAQCAtNzcsNiArNzcsMyBAQCBp
bmRleCA3YzI5ZTI3Ni4uYmVjYzAxOWYgMTAwNjQ0CiAgCQkiJHJlc29sdmNvbmYiIC1kICIkaWZu
YW1lIiAtZgogIAllbHNlCiAgCQlpZiBbIC1lICIkcmVzb2x2X2NvbmZfZGlyLyRpZm5hbWUiIF07
IHRoZW4KLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5h
YmxlLW11bHRpbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmls
ZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIu
cGF0Y2gKaW5kZXggYjk1ODExMGVmMS4uNjcyODY3YzhhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3Qt
ZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hl
bi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDExMTU3ODRkZmRm
MmU3MDk1Y2Y1OTlmOWJlY2VmNzA1YWM1N2Y4MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDYwMWU4OGU0YjJiNjRhMmZkODEyNTA3NjgyYTE2ZDQ5ZWJhOTJiZjMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+CiBE
YXRlOiBGcmksIDEwIE1hciAyMDIzIDAzOjQ4OjQ2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZC44OiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1J
TkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50
LWJ1aWxkLWlzc3Vlcy5wYXRjaAppbmRleCA4ODkwYzJkN2RjLi44YTY5NDUyZmY4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1J
TkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJl
dmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY5YmFiZWYzM2Iw
ZWU0YzYwZDg4MjE3OTc3NzdiOWFmZmVkZDQ3ZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDcwMDEyZjQ1MDczNTc1MjJkNjlhYWNkNGIxOWE2YTdlZDdjYmEwZDMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBTdGVmYW5vIENhcHBhIDxzdGVmYW5vLmNhcHBhLmtzODlAZ21h
aWwuY29tPgogRGF0ZTogU3VuLCAxMyBKYW4gMjAxOSAwMTo1MDo1MiArMDEwMAogU3ViamVjdDog
W1BBVENIXSByZW1vdmUgSU5DTFVERURJUiB0byBwcmV2ZW50IGJ1aWxkIGlzc3VlcwpAQCAtMTEs
NyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIENhcHBhIDxzdGVmYW5vLmNhcHBhLmtz
ODlAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCAxYTc3MmIwMi4uMGY5MTViMzkgMTAw
NzU1CitpbmRleCBhNjBkYTEzNy4uMzY3M2RlOGIgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsr
KyBiL2NvbmZpZ3VyZQogQEAgLTI2LDcgKzI2LDYgQEAgQlVJTEQ9Ci0tIAoyLjQ0LjEKCg==

--===============2333954422785071012==--

