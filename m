Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6BAC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 05:43:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1303.1788414186118214239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 22:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VL6Uy/Qg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Qg7fG5mH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a065cacd18-6689b39a-532c-45a5-b0d7-e03c3b18cc20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788414185;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=MruMEaUL7ikaZtsDnk212Jw7/hT5v4bx+MP9MyZYB+8=;
	b=VL6Uy/QgmaEyNXL2lV0pF+bsVtl/Oam0qj2s0jB6AYGxdOfYYVf/Dvs6txg0XVwe
	ydZYbFMWm863aUJo+67PZ1YdEHdt1ueeshrXGE+VBFiy/zHKjupom6oIVocrOOZzu1b
	0MiwWi7eQ/Srf0FXflN7RJiQ31BSUk3naPHg0B1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788414185;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=MruMEaUL7ikaZtsDnk212Jw7/hT5v4bx+MP9MyZYB+8=;
	b=Qg7fG5mHqKA0XN7eg16291NgXxMqj0NLKs/RPYZpy5lwtUx76/msH8Oxh44Cue0h
	anClOlpiPAED38cKW2lxpW8t/VvZHB9MiwzppmuP2xXercKQtGDufKIJ4mNzyBCOHDS
	cbTv4LVGnlip3uLyHAiz9aRKrNuh/SgltePeVg5U=
Content-Type: multipart/mixed; boundary="===============4077464874355873835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 7.2.0 SUCCEEDED
Message-ID: <010101a065cacd18-6689b39a-532c-45a5-b0d7-e03c3b18cc20-000000@us-west-2.amazonses.com>
Date: Thu, 3 Sep 2026 05:43:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 05:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244999

--===============4077464874355873835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *7.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-7.1.0-7.2.0.patch
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
From ebf35151af164fa38ec8f51d63101536c25a6ea0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Sep 2026 05:35:23 +0000
Subject: [PATCH] iproute2: upgrade 7.1.0 -> 7.2.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../0002-include-color.h-add-missing-include-for-types.patch    | 2 +-
 .../iproute2/{iproute2_7.1.0.bb => iproute2_7.2.0.bb}           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_7.1.0.bb => iproute2_7.2.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 1d3fc5bb40..ececd00539 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From dc1db1129a98530fb44b3d1a448e991adaf5b066 Mon Sep 17 00:00:00 2001
+From 61a0f63cd424b2e521b8b2e190c98271ced98de6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index 2078e48d8a..5ed8335be7 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 5c7bd395e9364a1c7c9370680ff265e50cf2b2b9 Mon Sep 17 00:00:00 2001
+From 7dc5b9726cdf214835c62967f7dcb8ceb660ece7 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
index c5944f2e54..096601029c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c"
+SRC_URI[sha256sum] = "4c2fa124c2cf0afd7ca34d1eeacba6ba048a56f6374e2aab93dafbdbd4eea9c0"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============4077464874355873835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-7.1.0-7.2.0.patch"

RnJvbSBlYmYzNTE1MWFmMTY0ZmEzOGVjOGY1MWQ2MzEwMTUzNmMyNWE2ZWEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNTozNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDcuMS4wIC0+IDcuMi4wCgotLS0KIC4uLjEtaW5jbHVkZS1saWJuZXRs
aW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCB8IDIgKy0KIC4uLi8w
MDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci10eXBlcy5wYXRjaCAg
ICB8IDIgKy0KIC4uLi9pcHJvdXRlMi97aXByb3V0ZTJfNy4xLjAuYmIgPT4gaXByb3V0ZTJfNy4y
LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0
ZTIve2lwcm91dGUyXzcuMS4wLmJiID0+IGlwcm91dGUyXzcuMi4wLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1p
bmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1
ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKaW5k
ZXggMWQzZmM1YmI0MC4uZWNlY2QwMDUzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1t
aXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1t
aXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRj
MWRiMTEyOWE5ODUzMGZiNDRiM2QxYTQ0OGU5OTFhZGFmNWIwNjYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDYxYTBmNjNjZDQyNGIyZTUyMWI4YjJlMTkwYzk4MjcxY2VkOThkZTYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgogRGF0ZTogU2F0LCAyNCBBdWcgMjAyNCAxNTozMjoyNSArMDIwMAogU3ViamVj
dDogW1BBVENIXSBpbmNsdWRlL2xpYm5ldGxpbmsuaDogYWRkIG1pc3NpbmcgaW5jbHVkZSBmb3Ig
aHRvYmU2NApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9p
cHJvdXRlMi8wMDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci10eXBl
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAw
Mi1pbmNsdWRlLWNvbG9yLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItdHlwZXMucGF0Y2gKaW5k
ZXggMjA3OGU0OGQ4YS4uNWVkODMzNWJlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2lu
Zy1pbmNsdWRlLWZvci10eXBlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyLzAwMDItaW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1
ZGUtZm9yLXR5cGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YzdiZDM5NWU5MzY0YTFj
N2M5MzcwNjgwZmYyNjVlNTBjZjJiMmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
ZGM1Yjk3MjZjZGYyMTQ4MzVjNjI5NjdmN2RjYjhjZWI2NjBlY2U3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQW5kcmVqIEtvemVtY2FrIDxhbmRyZWoua296ZW1jYWtAc2llbWVucy5j
b20+CiBEYXRlOiBUaHUsIDUgTWFyIDIwMjYgMDg6MDY6NTQgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaW5jbHVkZS9jb2xvci5oOiBhZGQgbWlzc2luZyBpbmNsdWRlIGZvciB0eXBlcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl83LjEuMC5i
YiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNy4yLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9pcHJvdXRlMi9pcHJvdXRlMl83LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl83LjIuMC5iYgppbmRleCBjNTk0NGYyZTU0Li4wOTY2
MDEwMjljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lw
cm91dGUyXzcuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIv
aXByb3V0ZTJfNy4yLjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9S
R19NSVJST1J9L2xpbnV4L3V0aWxzL25ldC8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDItaW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLXR5
cGVzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmQ5ZmEx
Yjk1ODA5NDE3MTU3Y2E4M2RkNzI5NTdlMzI2MWJkYmNlODk2MzUzY2I5MzZmODBhZjBiMzNhNGI1
YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YzJmYTEyNGMyY2YwYWZkN2NhMzRkMWVlYWNiYTZi
YTA0OGE1NmY2Mzc0ZTJhYWI5M2RhZmJkYmQ0ZWVhOWMwIgogCiBpbmhlcml0IHVwZGF0ZS1hbHRl
cm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============4077464874355873835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGSIZE changed from 66678 to 67466 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9644984 to 9688368 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGSIZE changed from 248608 to 252704 (+2%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 768067 to 776259 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3780917 to 3801322 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/7.1.0/devlink -> /usr/src/debug/iproute2/7.2.0/devlink, directory renamed /usr/src/debug/iproute2/7.1.0/ip -> /usr/src/debug/iproute2/7.2.0/ip, directory renamed /usr/src/debug/iproute2/7.1.0/tc -> /usr/src/debug/iproute2/7.2.0/tc, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/7.1.0/lib -> /usr/src/debug/iproute2/7.2.0/lib, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/7.1.0/genl -> /usr/src/debug/iproute2/7.2.0/genl, directory renamed /usr/src/debug/iproute2/7.1.0/tipc -> /usr/src/debug/iproute2/7.2.0
 /tipc, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/7.2.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/7.1.0/bridge -> /usr/src/debug/iproute2/7.2.0/bridge, directory renamed /usr/src/debug/iproute2/7.1.0/include -> /usr/src/debug/iproute2/7.2.0/include, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/7.1.0/misc -> /usr/src/debug/iproute2/7.2.0/misc, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/7.1.0/include/uapi/linux/can -> /usr/src/debug/iproute2/7.2.0/include/uapi/linux/can
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 634432 to 638528 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PV changed from "7.1.0" to "7.2.0"
packages/x86-64-v3-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.1.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.2.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch"

--===============4077464874355873835==--

