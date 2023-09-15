Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4856FEEEC28
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.29481.1694804395862207865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pql77yIK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kEtmMh92;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a9a36c4c0-2837adc2-a61e-4fb8-8762-824c054a34b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ovOzlz6jfQ8KQiP62xajwMLuI+6hQyuH2nF+ssz4ILI=;
	b=Pql77yIKCnvG7S7WMfBWdsBi9zZpdBlMGMXgG0OqKhILfy/DSoFwJjsIYRxpgL//
	9w2XJi/krz/SB5TW+3rHDPjN/XqXDzO4uu+iNuVKtFqr9Z9a/hH6dx5PLvEhTV4cLPt
	4Zy1xW0H6t6CimYPetByww04Qv3ROHbSSBLmeLm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ovOzlz6jfQ8KQiP62xajwMLuI+6hQyuH2nF+ssz4ILI=;
	b=kEtmMh92I1UWCZydm0nW9OiH3/SyuD69wpSRVBnYYWyehDOkYNVCKfOZSmrtJXxi
	mutFrlvfHvXGAlkCZZ3YHD8TpPYzX3CjfTu3lgkXwrKbn+c2EexL4rQlSgMmaaBjPm7
	xZ6L+OTU11BhGsBgU2yXt5odUmNSgRT2lCYu3HQs=
Content-Type: multipart/mixed; boundary="===============2582036330543174578=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xcb-proto: upgrading to 1.16.0 SUCCEEDED
Message-ID: <0101018a9a36c4c0-2837adc2-a61e-4fb8-8762-824c054a34b4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187750

--===============2582036330543174578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xcb-proto* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xcb-proto-upgrade-1.15.2-1.16.0.patch
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
From 23df4093ef9e38042503f8bc96256fbcb8f3fdba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 16:21:27 +0000
Subject: [PATCH] xcb-proto: upgrade 1.15.2 -> 1.16.0

---
 .../xorg-proto/{xcb-proto_1.15.2.bb => xcb-proto_1.16.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.15.2.bb => xcb-proto_1.16.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
index e60e7958a7..67c1e8d97d 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
            file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
-SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
+SRC_URI[sha256sum] = "a75a1848ad2a89a82d841a51be56ce988ff3c63a8d6bf4383ae3219d8d915119"
 
 inherit autotools pkgconfig python3native
 
-- 
2.39.2


--===============2582036330543174578==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xcb-proto-upgrade-1.15.2-1.16.0.patch"

RnJvbSAyM2RmNDA5M2VmOWUzODA0MjUwM2Y4YmM5NjI1NmZiY2I4ZjNmZGJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTY6MjE6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Y2ItcHJvdG86IHVwZ3JhZGUgMS4xNS4yIC0+IDEuMTYuMAoKLS0tCiAuLi4veG9yZy1wcm90by97
eGNiLXByb3RvXzEuMTUuMi5iYiA9PiB4Y2ItcHJvdG9fMS4xNi4wLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by97eGNiLXByb3RvXzEuMTUuMi5iYiA9PiB4Y2It
cHJvdG9fMS4xNi4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLXByb3RvL3hjYi1wcm90b18xLjE1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1wcm90by94Y2ItcHJvdG9fMS4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hjYi1wcm90b18xLjE1LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hjYi1wcm90b18x
LjE2LjAuYmIKaW5kZXggZTYwZTc5NThhNy4uNjdjMWU4ZDk3ZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veGNiLXByb3RvXzEuMTUuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94Y2ItcHJvdG9fMS4xNi4wLmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly94b3JnLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
L2luZGl2aWR1YWwvcHJvdG8vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
eGNiLXByb3RvLnBjLmluLXJlaW5zdGF0ZS1saWJkaXIucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1GaXgtaW5zdGFsbC1jb25mbGljdC13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MDcyYmViMWY2ODBhMmZlM2Y5
ZTUzNWI3OTdjMTQ2ZDIyNTI4OTkwYzcyZjYzZGRiNDlkMmYzNTBhMzY1M2VkIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImE3NWExODQ4YWQyYTg5YTgyZDg0MWE1MWJlNTZjZTk4OGZmM2M2M2E4ZDZi
ZjQzODNhZTMyMTlkOGQ5MTUxMTkiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBweXRo
b24zbmF0aXZlCiAKLS0gCjIuMzkuMgoK

--===============2582036330543174578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xcb-proto: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto: SRC_URI changed from "https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.15.2.tar.xz file://0001-xcb-proto.pc.in-reinstate-libdir.patch file://0001-Fix-install-conflict-when-enable-multilib.patch" to "https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.16.0.tar.xz file://0001-xcb-proto.pc.in-reinstate-libdir.patch file://0001-Fix-install-conflict-when-enable-multilib.patch"
packages/core2-32-poky-linux/xcb-proto/python-xcbgen: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/python-xcbgen: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dbg: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dbg: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PKGSIZE changed from 687996 to 710294 (+3%)
packages/core2-32-poky-linux/xcb-proto/xcb-proto-doc: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-doc: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-locale: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-locale: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-src: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-src: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-staticdev: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-staticdev: PV changed from "1.15.2" to "1.16.0"
packages/core2-32-poky-linux/xcb-proto/xcb-proto: PKGV changed from 1.15.2 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto: PV changed from "1.15.2" to "1.16.0"

--===============2582036330543174578==--

