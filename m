Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56200C3065D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2196.1719853077607331074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AEpwFqYK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LmcSBo48;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101906f3b5151-03af5e1e-1bf0-4c32-a9e7-56b7b40bc7be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hM4+spfVMiwKiURHmcOk5d2iIhinbqqPhqXi3ZRm1lc=;
	b=AEpwFqYKnZKmYqvZkEn+bXOg5lQZI1CmqSM6NZKXxgGpG9zPJU/apz32ia+L7wFL
	fFpGh+rDQsL0sbccRaBbm57TdN/2y8LtESc+30M6LgqS9YpnEMru910MPIwAWnyemLJ
	shbBhnQuDmrvjjLmmKIIpVKYPj8x9GjAUx4YG1EI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hM4+spfVMiwKiURHmcOk5d2iIhinbqqPhqXi3ZRm1lc=;
	b=LmcSBo48WyZRCbZ5bV2Z79dkdbtjogWT+YGqxm5Nu9xMmKc3oOO81nYDcaU6WnLr
	/BAqNqsU0ySRIbrPK8cZcO4dPX4p2coHLR3G4lxG0FGntCPB19IGXowmBGwwS7YVySY
	9aUFCC1W9Uunt/vPlGBjXvMcwy3tKx7OuxjpVmDE=
Content-Type: multipart/mixed; boundary="===============0902913138712801480=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.5 SUCCEEDED
Message-ID: <010101906f3b5151-03af5e1e-1bf0-4c32-a9e7-56b7b40bc7be-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201383

--===============0902913138712801480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.24.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.4-1.24.5.patch
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
From 8371c92995bce74ed53ce8e0dcf0970f30532a81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 14:30:04 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.4 -> 1.24.5

---
 ...streamer1.0-libav_1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
index dfd26f7df7..24c6c792c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d3803f36008e847fc4842c8dd366162baf8359526cc46c1851bf68bb638da73"
+SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.0


--===============0902913138712801480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.5.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.4" to "1.24.5"

--===============0902913138712801480==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.4-1.24.5.patch"

RnJvbSA4MzcxYzkyOTk1YmNlNzRlZDUzY2U4ZTBkY2YwOTcwZjMwNTMyYTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNDozMDowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI0LjQgLT4gMS4yNC41CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjQuNC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNC41LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjQuNC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNC41LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNC40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI0LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI0LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNC41LmJiCmluZGV4IGRmZDI2ZjdkZjcuLjI0YzZjNzkyYzUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNC41LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNGQzODAzZjM2MDA4ZTg0N2ZjNDg0MmM4ZGQzNjYxNjJiYWY4MzU5
NTI2Y2M0NmMxODUxYmY2OGJiNjM4ZGE3MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZmQxNmJk
ZmE1NmVkNTFjNDBiNDc0NjQ4ZmMzNWM0ZWRkZTNlOGFjOTM0YjEyYjgyYjQ5NzI3YjVkNzAzNTIx
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============0902913138712801480==--

