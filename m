Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37E3CA0FE2
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11410.1755263221863431685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FTs2/j7x;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=izTFH7nr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add73ba4-5b8502d5-7299-4efe-a691-f6db535246fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1J2LX3rXYuNb2InySyf79Z13leT5k1CdC8LidtOFk00=;
	b=FTs2/j7xxImGOtoCPtsZ/D35akRDpC8Q+Hkfsrqnk5XlG1wRVGkO7uGq2Ftwso5W
	H7ho1jT5ewTYoxYo0BNaAYaYDDh/z9knworEbRS4iM4Tu6i6cuOys84TMw648zaWayT
	z8OVl3tGdBGbkWRigXTHOD9l+KntzrUaUz3tf0O0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1J2LX3rXYuNb2InySyf79Z13leT5k1CdC8LidtOFk00=;
	b=izTFH7nrNa4BqVqkJZU051MAy6AJv2m2/u+eBG/jIgQoSpyLZFUlyZ3nvR6YgUCd
	QnWXMSJCrZA8zJN2qofIKJ7v3CUqc2ak3Bs3rj2Zetls3x0yB4TLsiphkcSy9/PzvHm
	EdE7dYTj3MbqAem7vxw+UsuPBIdD/cHVdXypdg7Q=
Content-Type: multipart/mixed; boundary="===============4814522519658598978=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.16.0 SUCCEEDED
Message-ID: <01010198add73ba4-5b8502d5-7299-4efe-a691-f6db535246fa-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221895

--===============4814522519658598978==
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
From 3a0280dd8dd2b02040205181c50294043694b3aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 07:59:42 +0000
Subject: [PATCH] iproute2: upgrade 6.15.0 -> 6.16.0

---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index c4dea39676..c701cb1aa1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
+From e16b5d664bd5f1a2a6f475dc2291dfcfd860a894 Mon Sep 17 00:00:00 2001
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


--===============4814522519658598978==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.15.0-6.16.0.patch"

RnJvbSAzYTAyODBkZDhkZDJiMDIwNDAyMDUxODFjNTAyOTQwNDM2OTRiM2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDc6NTk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjE1LjAgLT4gNi4xNi4wCgotLS0KIC4uLjEtaW5jbHVkZS1saWJu
ZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaCB8IDIgKy0KIC4u
Li9pcHJvdXRlMi97aXByb3V0ZTJfNi4xNS4wLmJiID0+IGlwcm91dGUyXzYuMTYuMC5iYn0gICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIve2lwcm91dGUy
XzYuMTUuMC5iYiA9PiBpcHJvdXRlMl82LjE2LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGli
bmV0bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRs
aW5rLmgtYWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItaHRvYmU2NC5wYXRjaAppbmRleCBjNGRlYTM5
Njc2Li5jNzAxY2IxYWExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyLzAwMDEtaW5jbHVkZS1saWJuZXRsaW5rLmgtYWRkLW1pc3NpbmctaW5j
bHVkZS1mb3ItaHRvYmU2NC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWU0MjdhYTFjNjQ3
Zjc0MWIwOGExZjBjNDQ0ODNlYTk3NGM3ZmM2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZTE2YjVkNjY0YmQ1ZjFhMmE2ZjQ3NWRjMjI5MWRmY2ZkODYwYTg5NCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBTYXQsIDI0IEF1ZyAyMDI0IDE1OjMyOjI1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGluY2x1ZGUvbGlibmV0bGluay5oOiBhZGQgbWlzc2luZyBpbmNsdWRlIGZvciBodG9iZTY0CmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYu
MTUuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4x
Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMTYuMC5iYgppbmRleCA1OTJlM2Ux
NWFmLi5kYzcxMDY5MDJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyXzYuMTUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyXzYuMTYuMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0g
IiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvbmV0LyR7QlBOfS8ke0JQfS50YXIueHog
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLWxpYm5ldGxpbmsuaC1hZGQtbWlzc2lu
Zy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiODA0MTg1NGE4ODI1ODNhZDUyNjM0NjY3MzZjOWM4YzY4Yzc0YjFhMzU3NTRh
Yjc3MGQyMzM0M2Y5NDc1MjhmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1OTAwY2NjMTVmOWFj
M2JmN2I3ZWFlODFkZWI1OTM3MTIzZGYzNWU5OTM0N2E3ZjExYTIyODE4NDgyZjBhOGQwIgogCiBp
bmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0t
IAoyLjQ3LjEKCg==

--===============4814522519658598978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9078144 to 9078624 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dev: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-doc: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-genl: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ip: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-locale: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-routel: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3717779 to 3718913 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ss: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tc: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2/iproute2: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2: PV changed from "6.15.0" to "6.16.0"
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.15.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.16.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch"
packages/core2-64-poky-linux/iproute2: PKGV changed from 6.15.0 [default] to 6.16.0 [default]
packages/core2-64-poky-linux/iproute2: PV changed from "6.15.0" to "6.16.0"

--===============4814522519658598978==--

