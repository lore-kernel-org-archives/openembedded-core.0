Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537FCC5B543
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1809.1746113636809887133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SixsHUVN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hJNLrFBS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7ba77d-41e11e70-77ae-4f61-88aa-ecd223a62bc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QuxRZut3bAn90G1yx9+vrWULO4iAa58MVMzvNCwAgPA=;
	b=SixsHUVNzu0Bou7BNWdgeYGnVbzfh0rNs27ufXrAl98nwRAhqTfuE4bp9kLZnsmw
	E2O95pxT/rcMpSlw9tgLX/6Cj38i2OJmVvbVMmNm32ETkW77RYELnoRAvmd57mD57vg
	rCW3ICYooZmW5h04vuXZliDq0gyyo3BSOdCb/U+A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QuxRZut3bAn90G1yx9+vrWULO4iAa58MVMzvNCwAgPA=;
	b=hJNLrFBSq4G+Rk5MGXmINO4uvBXYqQVsZYyy74rQuEBJPx8nf7dma0apvocLOW1C
	2ZVPpU8XUkdsCBJSuIYt7e/CEWbrMkmN9IvSc0OQll+ES01OoOEF0NtKJ1RUTQI6G+G
	N3VwJFVOlg7r92IPAMLUoor9ssg4AIbCS9kUG1hE=
Content-Type: multipart/mixed; boundary="===============4022983816460705058=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.1 SUCCEEDED
Message-ID: <010101968c7ba77d-41e11e70-77ae-4f61-88aa-ecd223a62bc4-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215876

--===============4022983816460705058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.0-1.26.1.patch
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
From c161858abe5ffb14568c7f3e20014b6773b668ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:27:47 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.0 -> 1.26.1

---
 ...streamer1.0-libav_1.26.0.bb => gstreamer1.0-libav_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.0.bb => gstreamer1.0-libav_1.26.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
index a2d35f8a93..96cf5a6925 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "707a8b687ff5fddcee5b02415e2ec9b71b4ac44d0b7aec3b477364ceecbf1ecf"
+SRC_URI[sha256sum] = "350a20b45b6655b6e10265430bdfbb3c436a96e9611b79caabef8f10abe570ea"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============4022983816460705058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.1.tar.xz"

--===============4022983816460705058==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.0-1.26.1.patch"

RnJvbSBjMTYxODU4YWJlNWZmYjE0NTY4YzdmM2UyMDAxNGI2NzczYjY2OGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzoyNzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI2LjAgLT4gMS4yNi4xCgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI2LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNi4xLmJiCmluZGV4IGEyZDM1ZjhhOTMuLjk2Y2Y1YTY5MjUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi4xLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNzA3YThiNjg3ZmY1ZmRkY2VlNWIwMjQxNWUyZWM5YjcxYjRhYzQ0
ZDBiN2FlYzNiNDc3MzY0Y2VlY2JmMWVjZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNTBhMjBi
NDViNjY1NWI2ZTEwMjY1NDMwYmRmYmIzYzQzNmE5NmU5NjExYjc5Y2FhYmVmOGYxMGFiZTU3MGVh
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============4022983816460705058==--

