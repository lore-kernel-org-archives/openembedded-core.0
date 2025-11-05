Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8953BCD4844
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1762384583580536215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VdJvWh/B;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EDniEIWl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564ee599-c0b18955-086a-49f6-888c-2cdb3bc63666-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vXYx64XD/ifzdlR27OUGEzZ2arovF2w91C9xCp3k9po=;
	b=VdJvWh/BXEUARPO1yCinA8l5gABcSIWBfIiZHlsslI7hwjB3wnbWoeltg1kLh8AW
	bdp5nEYbIvSPVq2Mv42JhjhtauJs3ziKoHDyb1wC979AZZ/oii8URFSH/dR9QVirTXS
	GWv/oNyJVsxIsjay6mBKlZ4iXYZ3N0PqsLINRf/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vXYx64XD/ifzdlR27OUGEzZ2arovF2w91C9xCp3k9po=;
	b=EDniEIWlDHx/N1we6DyEBUn3sQ32dnCCt8gibPwih8XctOxYSEJCpJFUzFg8aGqO
	42V/MxSVI2nyxss+qwbruvSXCJO8R6OdgeAX19uuaQa+0UdQPxdtmsbgmftmw2UZzrY
	zBgA7gfjwpDJOv1QuRELxkxj6n0mxhvQG3vC+l/w=
Content-Type: multipart/mixed; boundary="===============2207079767494998683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.7 SUCCEEDED
Message-ID: <0101019a564ee599-c0b18955-086a-49f6-888c-2cdb3bc63666-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225900

--===============2207079767494998683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.5-1.26.7.patch
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
From e6dfaaa5e1df68c56226bb29c7b037ac087b49c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:44:09 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7

---
 ...streamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
index c3ee529497..aa6c431daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
+SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============2207079767494998683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.5-1.26.7.patch"

RnJvbSBlNmRmYWFhNWUxZGY2OGM1NjIyNmJiMjljN2IwMzdhYzA4N2I0OWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMTo0NDowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI2LjUgLT4gMS4yNi43CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi43LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi43LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI2LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI2LjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNi43LmJiCmluZGV4IGMzZWU1Mjk0OTcuLmFhNmM0MzFkYWEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi43LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDZkZTA1ODg0ZWY0MjM3NmRkOGNkZTg5OTQwZjdiNTBjZWQ5NmY0
ZjZmNTI4ODhlNzY0Y2Q4MjMzZTc0ZjA1MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MWQ0YTdh
MTQ1MjdkOTdmZTBjZTdjY2VkYjM1NTRlOGY2OTJiMjE2NDI5ZWYyYjE4NTA5NDRiYmY1NDM1YzA5
IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============2207079767494998683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.7.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.26.5" to "1.26.7"

--===============2207079767494998683==--

