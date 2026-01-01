Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3950EEEE26B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103060.1767267479029304229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d89MIM02;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tuOd67FF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b7959b914-ee34b7e0-ce33-4f08-8d29-a7fe40c90bf3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6pUxyy3GMEwD527gHCPCnsWkWuGgO03QwAOw8rKGKCo=;
	b=d89MIM02Jc0tuh13wz6v6lyFPORKmG/ZyXDj4lU9JITjhT1takafgVoUafkYIh6U
	6p78WfB9UZSOrpZWBXh5XRjO2II/efgYn9G7BV4N68vFr5WIJ+cybSNjKzeRQHWHaQC
	1a8VrV5RKKamuUNhBYpVOh83fjhlXr8fiFYLRhD8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6pUxyy3GMEwD527gHCPCnsWkWuGgO03QwAOw8rKGKCo=;
	b=tuOd67FFGjpFtaIPNDe8cazqMINM5Nrv/dO+DpDejGhYv+kxr3wlHxPXc9vvsAI7
	WUOnA4KR4mx8H/XWyZYR3hqHWjvoou9z7Olty2kloW0MUyN9/VCjSf6bsNrYmrs41EA
	kahtdoeCcbE6PmngIrpp6Z0BI8RYj6ui0+u2mGLY=
Content-Type: multipart/mixed; boundary="===============3001599465440525277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019b7959b914-ee34b7e0-ce33-4f08-8d29-a7fe40c90bf3-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228806

--===============3001599465440525277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.9-1.26.10.patch
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
From 0d4e42ed8f5a87b8aabc7b8f0c16feb3edc66c22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 11:02:17 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.9 -> 1.26.10

---
 ...treamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.26.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.26.10.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.10.bb
index a652dbba33..2a9a4bf588 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "08a8e944fc61ef26df515784a089c8ac41765304a5d55b98199835b28a98dbdf"
+SRC_URI[sha256sum] = "c8c2fd29cc063a6d26c314cd1a0a3a3060c8a029981b9520fab52c4206d11611"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============3001599465440525277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 927080 to 931808 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-libav/1.26.9/ext/libav -> /usr/src/debug/gstreamer1.0-libav/1.26.10/ext/libav
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 554407 to 558154 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGSIZE changed from 273176 to 277272 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.26.9" to "1.26.10"

--===============3001599465440525277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.9-1.26.10.patch"

RnJvbSAwZDRlNDJlZDhmNWE4N2I4YWFiYzdiOGYwYzE2ZmViM2VkYzY2YzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMTowMjoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI2LjkgLT4gMS4yNi4xMAoKLS0tCiAuLi50cmVh
bWVyMS4wLWxpYmF2XzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNi4xMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuMTAuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1s
aWJhdl8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI2
LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi4xMC5iYgppbmRleCBhNjUyZGJiYTMzLi4yYTlhNGJmNTg4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2XzEuMjYuMTAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjkzMzNkYWEwNDRjYjc3ZTQ4NmNjMzYxMjlmN2E3
NzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFt
ZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOGE4ZTk0NGZjNjFlZjI2ZGY1MTU3ODRhMDg5YzhhYzQx
NzY1MzA0YTVkNTViOTgxOTk4MzViMjhhOThkYmRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4
YzJmZDI5Y2MwNjNhNmQyNmMzMTRjZDFhMGEzYTMwNjBjOGEwMjk5ODFiOTUyMGZhYjUyYzQyMDZk
MTE2MTEiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi40Ny4x
Cgo=

--===============3001599465440525277==--

