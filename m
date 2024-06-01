Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FFDC3271D
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.42237.1717263218752894487
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JOJngAXT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cACDVkUj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018fd4dd395a-10ed0164-5150-4250-80b1-b6ca5f2e56cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oD09GqIQ/qxag6a26ha7rTE4aT6j4AikdIZ8q5FeZos=;
	b=JOJngAXTv8jBVvVHwsdZD5Scu8V93KxHd2j2NckO28sgUgXQIGzWTSR3pFEn1IAv
	QWF5R4GwZnojsQCLRi2L/bUW7WVKtMBoVZmqH1vDyKiHtPXuh+NlosaWiW4XFb6KBxX
	4oFL6oGdQi1N6mxEVuXPyOKAZVAx4ftrZd5edfwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oD09GqIQ/qxag6a26ha7rTE4aT6j4AikdIZ8q5FeZos=;
	b=cACDVkUjvlbGNC0/eRE7O16A+wRVekHWcZFd9eDQfUIdxl1mUBZfljCDOWqOx/nX
	w+EiyUVncgpeiBIoUg8n1QLDcpJC0KJhCfx74iviqVI0KuYPS2e6R7Ynvs68AuJuwxs
	SUSHwCyrRdDMxLCtk0x5CttBWIVN37KgwFN5COqY=
Content-Type: multipart/mixed; boundary="===============6418745024457789690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.4 SUCCEEDED
Message-ID: <0101018fd4dd395a-10ed0164-5150-4250-80b1-b6ca5f2e56cb-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200170

--===============6418745024457789690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.3-1.24.4.patch
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
From 1199250d9bff57f80efc29565a0954c2a73f413d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 15:07:19 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.3 -> 1.24.4

---
 ...reamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
index 5fbf860741..6f05863486 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ecdb3e2ba94ea2c82b93a8c715d5a7e04f9726a8838c0a6b17694928fd1e8595"
+SRC_URI[sha256sum] = "5510358316eb5c965829a393714b4d88306033cd64db3eae8cc62b41ae80a392"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.0


--===============6418745024457789690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.4.tar.xz"

--===============6418745024457789690==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.3-1.24.4.patch"

RnJvbSAxMTk5MjUwZDliZmY1N2Y4MGVmYzI5NTY1YTA5NTRjMmE3M2Y0MTNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNTowNzoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yNC4zIC0+IDEuMjQuNAoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjQuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yNC4zLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNC40LmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjQuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjI0LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjQuNC5iYgppbmRleCA1ZmJmODYwNzQxLi42ZjA1ODYzNDg2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI0LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC40LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlY2RiM2UyYmE5NGVhMmM4MmI5M2E4Yzcx
NWQ1YTdlMDRmOTcyNmE4ODM4YzBhNmIxNzY5NDkyOGZkMWU4NTk1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU1MTAzNTgzMTZlYjVjOTY1ODI5YTM5MzcxNGI0ZDg4MzA2MDMzY2Q2NGRiM2VhZThj
YzYyYjQxYWU4MGEzOTIiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAiZ3N0cmVh
bWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCi0tIAoy
LjQ0LjAKCg==

--===============6418745024457789690==--

