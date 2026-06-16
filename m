Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A72DCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:27:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147371.1781587636062203104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 22:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SR/glEMu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W+1Ae43V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ecee5ebcb-1427baa0-6e0f-4609-be85-725b802b031a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781587635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CHcGiRhedvO5gopIvMaStKvoefoC8UCcZZeFYLfVCq0=;
	b=SR/glEMuYs2JlYgFNpJRsltjCJ2/7sflxjrnSCs8rlOCY9UvKKzq+BubYvP6fmCz
	p3bd/wpu5EWyP9lOjonm6gtQJ3mBhg1Fyh0CJqGrrF5o9OQbeyUn+c1upsYAESOQuX2
	8GwiRUUmg1r1yJdjYV6KKjxwkwWSeWifXHyo9gTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781587635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CHcGiRhedvO5gopIvMaStKvoefoC8UCcZZeFYLfVCq0=;
	b=W+1Ae43VEvCUgjViJyKsqCAPJQtRiHd/xTgTFKZs20wRwlOFHM0yvWzzkEBaE43M
	ITbbk9Wh+mIOSw1DIAunPtB86ih23qrQYvq4nksx9+WXeqGFs8RYxWjrrxwF0GRSQf7
	U74X4uKVVDrUyUR9uMCNTNp6bqNWuqk3zh3PBFIg=
Content-Type: multipart/mixed; boundary="===============7066330653664615899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] iproute2: upgrading to 7.1.0 SUCCEEDED
Message-ID: <0101019ecee5ebcb-1427baa0-6e0f-4609-be85-725b802b031a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Jun 2026 05:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 05:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238864

--===============7066330653664615899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *7.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-7.0.0-7.1.0.patch
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
From 5811776c94e1eb86c773049005cb09142ad75817 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Jun 2026 05:15:13 +0000
Subject: [PATCH] iproute2: upgrade 7.0.0 -> 7.1.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../0002-include-color.h-add-missing-include-for-types.patch    | 2 +-
 .../iproute2/{iproute2_7.0.0.bb => iproute2_7.1.0.bb}           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_7.0.0.bb => iproute2_7.1.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index efca33b6cf..1d3fc5bb40 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From c32fe3424c067baebbf6c263886e04bb99a5af77 Mon Sep 17 00:00:00 2001
+From dc1db1129a98530fb44b3d1a448e991adaf5b066 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index c5c7254c61..2078e48d8a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 2289366b53c5bdc117907e88578d24d2007fd035 Mon Sep 17 00:00:00 2001
+From 5c7bd395e9364a1c7c9370680ff265e50cf2b2b9 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
index 15f626de3e..c5944f2e54 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e"
+SRC_URI[sha256sum] = "fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============7066330653664615899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-7.0.0-7.1.0.patch"

RnJvbSA1ODExNzc2Yzk0ZTFlYjg2Yzc3MzA0OTAwNWNiMDkxNDJhZDc1ODE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgSnVuIDIwMjYgMDU6MTU6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA3LjAuMCAtPiA3LjEuMAoKLS0tCiAuLi4xLWluY2x1ZGUtbGlibmV0
bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggfCAyICstCiAuLi4v
MDAwMi1pbmNsdWRlLWNvbG9yLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItdHlwZXMucGF0Y2gg
ICAgfCAyICstCiAuLi4vaXByb3V0ZTIve2lwcm91dGUyXzcuMC4wLmJiID0+IGlwcm91dGUyXzcu
MS4wLmJifSAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91
dGUyL3tpcHJvdXRlMl83LjAuMC5iYiA9PiBpcHJvdXRlMl83LjEuMC5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEt
aW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNs
dWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoCmlu
ZGV4IGVmY2EzM2I2Y2YuLjFkM2ZjNWJiNDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQt
bWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQt
bWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBj
MzJmZTM0MjRjMDY3YmFlYmJmNmMyNjM4ODZlMDRiYjk5YTVhZjc3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkYzFkYjExMjlhOTg1MzBmYjQ0YjNkMWE0NDhlOTkxYWRhZjViMDY2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KIERhdGU6IFNhdCwgMjQgQXVnIDIwMjQgMTU6MzI6MjUgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gaW5jbHVkZS9saWJuZXRsaW5rLmg6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9y
IGh0b2JlNjQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIv
aXByb3V0ZTIvMDAwMi1pbmNsdWRlLWNvbG9yLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItdHlw
ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAw
MDItaW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLXR5cGVzLnBhdGNoCmlu
ZGV4IGM1YzcyNTRjNjEuLjIwNzhlNDhkOGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMi1pbmNsdWRlLWNvbG9yLmgtYWRkLW1pc3Np
bmctaW5jbHVkZS1mb3ItdHlwZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2luZy1pbmNs
dWRlLWZvci10eXBlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjI4OTM2NmI1M2M1YmRj
MTE3OTA3ZTg4NTc4ZDI0ZDIwMDdmZDAzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NWM3YmQzOTVlOTM2NGExYzdjOTM3MDY4MGZmMjY1ZTUwY2YyYjJiOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFuZHJlaiBLb3plbWNhayA8YW5kcmVqLmtvemVtY2FrQHNpZW1lbnMu
Y29tPgogRGF0ZTogVGh1LCA1IE1hciAyMDI2IDA4OjA2OjU0ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGluY2x1ZGUvY29sb3IuaDogYWRkIG1pc3NpbmcgaW5jbHVkZSBmb3IgdHlwZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNy4wLjAu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzcuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvaXByb3V0ZTIvaXByb3V0ZTJfNy4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNy4xLjAuYmIKaW5kZXggMTVmNjI2ZGUzZS4uYzU5
NDRmMmU1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9p
cHJvdXRlMl83LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUy
L2lwcm91dGUyXzcuMS4wLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxP
UkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59LyR7QlB9LnRhci54eiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci10
eXBlcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU2Mjg5
MGY3YjVkZTYzYzA1YTNiZjMzMWRjOGRlYjRjMDE1YzMzNjAxM2YzNDFhNGVkZjQ2OTY5Nzk3ZjJm
NGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmQ5ZmExYjk1ODA5NDE3MTU3Y2E4M2RkNzI5NTdl
MzI2MWJkYmNlODk2MzUzY2I5MzZmODBhZjBiMzNhNGI1YyIKIAogaW5oZXJpdCB1cGRhdGUtYWx0
ZXJuYXRpdmVzIGJhc2gtY29tcGxldGlvbiBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============7066330653664615899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGSIZE changed from 64338 to 66678 (+4%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9698032 to 9645664 (-1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/7.0.0/ip -> /usr/src/debug/iproute2/7.1.0/ip, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/can -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/7.1.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/7.0.0/include -> /usr/src/debug/iproute2/7.1.0/include, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/7.0.0/genl -> /usr/src/debug/iproute2/7.1.0/genl, directory renamed /usr/src/debug/iproute2/7.0.0/bridge -> /usr/src/debug/iproute2/7.1.0/bridge, directory renam
 ed /usr/src/debug/iproute2/7.0.0/tc -> /usr/src/debug/iproute2/7.1.0/tc, directory renamed /usr/src/debug/iproute2/7.0.0/devlink -> /usr/src/debug/iproute2/7.1.0/devlink, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/7.0.0/misc -> /usr/src/debug/iproute2/7.1.0/misc, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/7.0.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/7.1.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/7.0.0/tipc -> /usr/src/debug/iproute2/7.1.0/tipc, removed "/usr/src/debug/iproute2/7.0.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/can.h /usr/src/debug/iproute2/7.0.0/lib/ax25_ntop.c /usr
 /src/debug/iproute2/7.0.0/lib/mpls_ntop.c /usr/src/debug/iproute2/7.0.0/lib/rose_ntop.c /usr/src/debug/iproute2/7.0.0/lib/bpf_legacy.c /usr/src/debug/iproute2/7.0.0/lib/ppp_proto.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/7.0.0/lib/bpf_glue.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/inet_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/7.0.0/lib/sha1.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ax25.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/xdp_diag.h /usr/src/deb
 ug/iproute2/7.0.0/include/uapi/linux/snmp.h /usr/src/debug/iproute2/7.0.0/lib/mnl_utils.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/7.0.0/lib/utils_math.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_link.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/veth.h /usr/src/debug/iproute2/7.0.0/lib/json_print_math.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mptcp_pm.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2
 /7.0.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/7.0.0/lib/libgenl.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/fou.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ila.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/7.0.0/lib/bridge.c /usr/src/debug/iproute2/7.0.0/lib/cg_map.c /usr/src/debug/iproute2/7.0.0/lib/escape.c /usr/src/debug/iproute2/7.0.0/lib/ll_map.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_addrlabel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/7.0.0/lib/color.c /usr/src/debug/iproute2/7.0.0/lib/names.c /usr/src/de
 bug/iproute2/7.0.0/lib/utils.c /usr/src/debug/iproute2/7.0.0/lib/libnetlink.c /usr/src/debug/iproute2/7.0.0/lib/json_print.c /usr/src/debug/iproute2/7.0.0/lib/ll_proto.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_local.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_tunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/7.0.0/lib/mnlg.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/7.0.0/lib/inet_proto.c /usr/src/debug/iproute2/7.0.0/lib/ll_addr.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/nexthop.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/
 types.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/7.0.0/lib/selinux.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/7.0.0/lib/ll_types.c /usr/src/debug/iproute2/7.0.0/lib/rt_names.c /usr/src/debug/iproute2/7.0.0/lib/json_writer.c /usr/src/debug/iproute2/7.0.0/lib/netrom_ntop.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rose.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/7.0.0/lib/fs.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/sctp.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/7.0.0/lib/
 mpls_pton.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/7.0.0/lib/exec.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/net_namespace.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/socket.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/7.0.0/lib/namespace.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rpl_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_hmac.h", added "/usr/src/debug/iproute2/7.1.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/can.h /usr/src/debug/iproute2/7.1.0/lib/mpls_ntop.c /usr/src/debug/iproute2/7.1.0/lib/bpf_legacy.c /usr/src/debug/iproute2/7.1.0/lib/ppp_proto.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/7.1.0/lib/bpf_glue.c /usr/src/debug/iproute2/7
 .1.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/inet_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/7.1.0/lib/sha1.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/xdp_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/snmp.h /usr/src/debug/iproute2/7.1.0/lib/mnl_utils.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/seg6_iptunnel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/7.1.0/l
 ib/utils_math.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_link.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/veth.h /usr/src/debug/iproute2/7.1.0/lib/json_print_math.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/mptcp_pm.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/7.1.0/lib/libgenl.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/fou
 .h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ila.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/7.1.0/lib/bridge.c /usr/src/debug/iproute2/7.1.0/lib/cg_map.c /usr/src/debug/iproute2/7.1.0/lib/escape.c /usr/src/debug/iproute2/7.1.0/lib/ll_map.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_addrlabel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/7.1.0/lib/color.c /usr/src/debug/iproute2/7.1.0/lib/names.c /usr/src/debug/iproute2/7.1.0/lib/utils.c /usr/src/debug/iproute2/7.1.0/lib/libnetlink.c /usr/src/debug/iproute2/7.1.0/lib/json_print.c /usr/src/debug/iproute2/7.1.0/lib/ll_proto.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/seg6_local.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_tunnel.h /usr/src/debug/
 iproute2/7.1.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/7.1.0/lib/mnlg.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/7.1.0/lib/inet_proto.c /usr/src/debug/iproute2/7.1.0/lib/ll_addr.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/7.1.0/lib/selinux.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/nexthop.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/types.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/7.1.0/lib/ll_types.c /usr/src/debug/iproute2/7.1.0/lib/rt_names.c
  /usr/src/debug/iproute2/7.1.0/lib/json_writer.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/7.1.0/lib/fs.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/sctp.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/7.1.0/lib/mpls_pton.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/7.1.0/lib/exec.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/net_namespace.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/socket.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/7.1.0/lib/namespace.c /usr/src/debug/iproute2/7.1.0/include/uapi/linux/rpl
 _iptunnel.h /usr/src/debug/iproute2/7.1.0/include/uapi/linux/seg6_hmac.h"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3784323 to 3780917 (-0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2: PKGV changed from 7.0.0 [default] to 7.1.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PV changed from "7.0.0" to "7.1.0"
packages/x86-64-v3-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.0.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.1.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch"

--===============7066330653664615899==--

