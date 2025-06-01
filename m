Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C18AC5B559
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.27787.1748786127441297873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=znd78j20;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R7vKG8ER;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc69fb3-17b61faa-df1e-4966-8869-c0433353b731-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ovFZycwGMPz0Hl3nC4N9fMy6+PxGdlaxkUqb/QqqcuA=;
	b=znd78j209DI3qMwJh+J1+D6RkvVLomnsOJprjOxWulVPXCQ69897ZvUvGMHKNBQt
	QZZuUZSRrpzGhgRtsDkrJkxHfGrqouY5aZNa61lPOZi21hmrtjcO3ANIGy6HAFDz8Fl
	uoMEc6DBd432N36qFS0kHLvh9ko93hQ6GB91MzPg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ovFZycwGMPz0Hl3nC4N9fMy6+PxGdlaxkUqb/QqqcuA=;
	b=R7vKG8ER6VuSR00wSKISBc7mUQXyV6fPIyhuimwMJg+lHrG2hkYPAjNWuIBNpV1+
	bVIx0Rn9VEr1rLX/VcPYN1ctPqpWawxZFh+KKk5jylRuIz9n5cWGYIXXv8cIuVdvkwK
	BlmZn3gAVxmPAchB417pahE3TIgeydtjL4KmD5R0=
Content-Type: multipart/mixed; boundary="===============1963009552280124447=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.15.0 SUCCEEDED
Message-ID: <010101972bc69fb3-17b61faa-df1e-4966-8869-c0433353b731-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217573

--===============1963009552280124447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *6.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.14.0-6.15.0.patch
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
From 0c5144ebdc3370ad2930dd227e1f7a8ed27447fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 07:55:48 +0000
Subject: [PATCH] iproute2: upgrade 6.14.0 -> 6.15.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.14.0.bb => iproute2_6.15.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.14.0.bb => iproute2_6.15.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index c4dea39676..9bfe43e019 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
+From 2f39b19816d6682e805a9a8aac21495647b112e2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
index a32ac34245..592e3e15af 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f"
+SRC_URI[sha256sum] = "8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============1963009552280124447==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.14.0-6.15.0.patch"

RnJvbSAwYzUxNDRlYmRjMzM3MGFkMjkzMGRkMjI3ZTFmN2E4ZWQyNzQ0N2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNzo1NTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDYuMTQuMCAtPiA2LjE1LjAKCi0tLQogLi4uMS1pbmNsdWRlLWxpYm5l
dGxpbmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIHwgMiArLQogLi4u
L2lwcm91dGUyL3tpcHJvdXRlMl82LjE0LjAuYmIgPT4gaXByb3V0ZTJfNi4xNS4wLmJifSAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi97aXByb3V0ZTJf
Ni4xNC4wLmJiID0+IGlwcm91dGUyXzYuMTUuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJu
ZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxp
bmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoCmluZGV4IGM0ZGVhMzk2
NzYuLjliZmU0M2UwMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNs
dWRlLWZvci1odG9iZTY0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNs
dWRlLWZvci1odG9iZTY0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZTQyN2FhMWM2NDdm
NzQxYjA4YTFmMGM0NDQ4M2VhOTc0YzdmYzYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyZjM5YjE5ODE2ZDY2ODJlODA1YTlhOGFhYzIxNDk1NjQ3YjExMmUyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4K
IERhdGU6IFNhdCwgMjQgQXVnIDIwMjQgMTU6MzI6MjUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
aW5jbHVkZS9saWJuZXRsaW5rLmg6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yIGh0b2JlNjQKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4x
NC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjE1
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjE0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xNS4wLmJiCmluZGV4IGEzMmFjMzQy
NDUuLjU5MmUzZTE1YWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTJfNi4xNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
aXByb3V0ZTIvaXByb3V0ZTJfNi4xNS4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAi
JHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59LyR7QlB9LnRhci54eiBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5n
LWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJhNmQyMzU4ODE1MDA5NjU5MWMzZDAwZmMyN2EzMjRhODJlZTcxZDdhMWE5ZWVh
NzhkZjVkZjE3YWQ5Yjg0NjFmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgwNDE4NTRhODgyNTgz
YWQ1MjYzNDY2NzM2YzljOGM2OGM3NGIxYTM1NzU0YWI3NzBkMjMzNDNmOTQ3NTI4ZmIiCiAKIGlu
aGVyaXQgdXBkYXRlLWFsdGVybmF0aXZlcyBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0g
CjIuNDcuMQoK

--===============1963009552280124447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9024008 to 9037464 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dev: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-doc: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-genl: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ip: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 718844 to 722947 (+1%)
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-locale: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-routel: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3710501 to 3717779 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ss: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tc: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2/iproute2: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2: PKGV changed from 6.14.0 [default] to 6.15.0 [default]
packages/core2-64-poky-linux/iproute2: PV changed from "6.14.0" to "6.15.0"
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.14.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.15.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"

--===============1963009552280124447==--

