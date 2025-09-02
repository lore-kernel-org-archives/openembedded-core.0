Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648C5CA1013
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.89789.1756850183449696454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0U4U7eM7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qx5ADk4S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101990c6e67e6-ded007bc-3407-483f-b4d5-18bd9678475d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z7MxxrOv1fYi3PYSQoUJ1mLp0ZaRAKFTbCWn16hKiHs=;
	b=0U4U7eM7DjtTgE+14dXLff2dElsUi8d8JTUxzAMXPR+GSCaJ6NHkqRop4XaaEbAq
	4VNUkN6u0EFI730oPwS8+IeBsz378SLi2PlF1dq8tu7ul0TecgmTPr9TkanDNUovEZ7
	Or1StVbhtbF1cnDYW/95ILRWYLH2BI9kmHpGnOPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z7MxxrOv1fYi3PYSQoUJ1mLp0ZaRAKFTbCWn16hKiHs=;
	b=qx5ADk4SSb3LJrG/Bix5gzUYFL/tA/hDsZH8ZjSWr0UMy5Si3iIL7goNrwhJ80wE
	ZENpxgaHcskpffYFbuIO28BpwnQhcJpL70biRFkS3QkaA8xhKve3A6czX8v9BL/tjpt
	P8+/y8euvOoJNryod4Z/CyDQ/wUWhWKu2+Qd65wI=
Content-Type: multipart/mixed; boundary="===============8911237254166351214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.16.0 SUCCEEDED
Message-ID: <010101990c6e67e6-ded007bc-3407-483f-b4d5-18bd9678475d-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222764

--===============8911237254166351214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *6.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.15.0-6.16.0.patch
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
From b90423be25c1ebeafe56968eea6b1bf822b0f21d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 16:27:44 +0000
Subject: [PATCH] iproute2: upgrade 6.15.0 -> 6.16.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index c4dea39676..cb4d3b10fe 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
+From 5a392823cfb4b7a669cc72f541da20c5649df796 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
index 592e3e15af..dc7106902c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb"
+SRC_URI[sha256sum] = "5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============8911237254166351214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.15.0-6.16.0.patch"

RnJvbSBiOTA0MjNiZTI1YzFlYmVhZmU1Njk2OGVlYTZiMWJmODIyYjBmMjFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNjoyNzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDYuMTUuMCAtPiA2LjE2LjAKCi0tLQogLi4uMS1pbmNsdWRlLWxpYm5l
dGxpbmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIHwgMiArLQogLi4u
L2lwcm91dGUyL3tpcHJvdXRlMl82LjE1LjAuYmIgPT4gaXByb3V0ZTJfNi4xNi4wLmJifSAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi97aXByb3V0ZTJf
Ni4xNS4wLmJiID0+IGlwcm91dGUyXzYuMTYuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJu
ZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxp
bmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoCmluZGV4IGM0ZGVhMzk2
NzYuLmNiNGQzYjEwZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNs
dWRlLWZvci1odG9iZTY0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNs
dWRlLWZvci1odG9iZTY0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZTQyN2FhMWM2NDdm
NzQxYjA4YTFmMGM0NDQ4M2VhOTc0YzdmYzYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA1YTM5MjgyM2NmYjRiN2E2NjljYzcyZjU0MWRhMjBjNTY0OWRmNzk2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4K
IERhdGU6IFNhdCwgMjQgQXVnIDIwMjQgMTU6MzI6MjUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
aW5jbHVkZS9saWJuZXRsaW5rLmg6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yIGh0b2JlNjQKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4x
NS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjE2
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjE1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xNi4wLmJiCmluZGV4IDU5MmUzZTE1
YWYuLmRjNzEwNjkwMmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTJfNi4xNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
aXByb3V0ZTIvaXByb3V0ZTJfNi4xNi4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAi
JHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59LyR7QlB9LnRhci54eiBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5n
LWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI4MDQxODU0YTg4MjU4M2FkNTI2MzQ2NjczNmM5YzhjNjhjNzRiMWEzNTc1NGFi
NzcwZDIzMzQzZjk0NzUyOGZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5MDBjY2MxNWY5YWMz
YmY3YjdlYWU4MWRlYjU5MzcxMjNkZjM1ZTk5MzQ3YTdmMTFhMjI4MTg0ODJmMGE4ZDAiCiAKIGlu
aGVyaXQgdXBkYXRlLWFsdGVybmF0aXZlcyBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0g
CjIuNDcuMQoK

--===============8911237254166351214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9078128 to 9078648 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3717779 to 3718913 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PV changed from "6.15.0" to "6.16.0"
packages/x86-64-v3-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.15.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.16.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"

--===============8911237254166351214==--

