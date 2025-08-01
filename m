Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9139ECA0FE5
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88808.1754057268481398641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WAFqyxuR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HS+VtpDv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f62610-d7a3d6d6-8122-4734-a3a7-964637909553-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JQuDNPnFhGFV5SKnPsFRbaPexjX8epKy3ho41mAobGM=;
	b=WAFqyxuRAhdLMxD9w7iJBBFg32oHh4ykzRXKZSre6ZxCAL9PCDxFrckThv1Qp3H5
	XyXcFnor2YeuetqOBgNddqB7iIqvtxrtG8YoH8dxxl1VzhgL/CKTr/XqwCs3Ey/4hyc
	2K3ripWmNnLTBdpWfUgf3X3BMfjT/kAzZ8HdDmcw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JQuDNPnFhGFV5SKnPsFRbaPexjX8epKy3ho41mAobGM=;
	b=HS+VtpDvoKyyMm+CFxrGpyXBleLUqI3/JRF3Au9tHiMBHTsw2n6HmfrdgeypiatZ
	c2BS7cXApdbmHXaw0ztwFHOz5H7eT37kuP1nt/oil2paOfsAKFEFx3itOUgTpNTV6QI
	sd8Zogdn5cASPsFcvAblHrZTKXr0j7OwsAponoAI=
Content-Type: multipart/mixed; boundary="===============7197691379610289116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.4 SUCCEEDED
Message-ID: <0101019865f62610-d7a3d6d6-8122-4734-a3a7-964637909553-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221325

--===============7197691379610289116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.3-1.26.4.patch
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
From b77976616e49f3f1fcfa271a18d8a25c493388cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 12:28:50 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.3 -> 1.26.4

---
 ...streamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.4.bb
index 4125fdf31f..2ce7e39f45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ada7e50a3b9b8ba3e405b14c4021e25fbb10379f77d2ce490aa16523ed2724d"
+SRC_URI[sha256sum] = "2be7c7272f9a5b5e4d5ef211b948fb751f7048bcc3675bbe633cef6c6df682fe"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============7197691379610289116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.3" to "1.26.4"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.4.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.26.3" to "1.26.4"

--===============7197691379610289116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.3-1.26.4.patch"

RnJvbSBiNzc5NzY2MTZlNDlmM2YxZmNmYTI3MWExOGQ4YTI1YzQ5MzM4OGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMjoyODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI2LjMgLT4gMS4yNi40CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuMy5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuMy5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi40LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNi4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI2LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI2LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNi40LmJiCmluZGV4IDQxMjVmZGYzMWYuLjJjZTdlMzlmNDUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi40LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiM2FkYTdlNTBhM2I5YjhiYTNlNDA1YjE0YzQwMjFlMjVmYmIxMDM3
OWY3N2QyY2U0OTBhYTE2NTIzZWQyNzI0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYmU3Yzcy
NzJmOWE1YjVlNGQ1ZWYyMTFiOTQ4ZmI3NTFmNzA0OGJjYzM2NzViYmU2MzNjZWY2YzZkZjY4MmZl
IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============7197691379610289116==--

