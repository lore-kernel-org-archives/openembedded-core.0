Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4908C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17867.1736936767952238247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GFCqdL40;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fEezEEq9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697ff357-b50e5005-c172-4e11-a865-4657a370b7d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IUBVgCsHlHkOMAc0/ppD99dAVcBkwwAls7OS5xOjhm4=;
	b=GFCqdL40FgL8mOykjO/MpGmE40sRctul2F5BpyLo83UM4BbDPZ40E+PfgESnd4qh
	eZMwnyU+tf+E6QOiOZs7dhudu1eOxJbhfV4cYS0o+2zWR4444OcuuvzYEgMu99FLJ5n
	LY23zS4osZLo0AR45boH6zvUsVcSSOWhVJsNG4BM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IUBVgCsHlHkOMAc0/ppD99dAVcBkwwAls7OS5xOjhm4=;
	b=fEezEEq9yYuK3dRsKYreqe4O1tJoaE0p1/cFS3ryB/PRsvc/II2TFjGSJDN68D8f
	BAu3BI5ytLvw9D5+H2DeHmBbA2X7KxH1Z3AD+zwvHMkCYdRJGwf4/twiCcDgXG/gLup
	K69VcDuG7P8DE3lGTZ0t4O8toy0wuPA5mkvygZCM=
Content-Type: multipart/mixed; boundary="===============9067776016434172931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.11 SUCCEEDED
Message-ID: <01010194697ff357-b50e5005-c172-4e11-a865-4657a370b7d9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209880

--===============9067776016434172931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.24.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.10-1.24.11.patch
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
From 8c511becbde36560c5dfdc5fe0f6dd375c201ef5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 10:02:15 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.10 -> 1.24.11

---
 ...reamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.11.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.11.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.11.bb
index 629e9516c3..c886041c68 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
+SRC_URI[sha256sum] = "13776fc16f7ce587d437d56d83e08c9224768dddc897dd3c88208d970a6aa422"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.1


--===============9067776016434172931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.10-1.24.11.patch"

RnJvbSA4YzUxMWJlY2JkZTM2NTYwYzVkZmRjNWZlMGY2ZGQzNzVjMjAxZWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMTA6MDI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yNC4xMCAtPiAxLjI0LjExCgotLS0KIC4uLnJl
YW1lcjEuMC1saWJhdl8xLjI0LjEwLmJiID0+IGdzdHJlYW1lcjEuMC1saWJhdl8xLjI0LjExLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuMTEuYmJ9ICg5MSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1saWJhdl8xLjI0LjEwLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjI0LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjI0LjExLmJiCmluZGV4IDYyOWU5NTE2YzMuLmM4ODYwNDFjNjgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNC4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuMTEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjkzMzNkYWEwNDRjYjc3ZTQ4NmNjMzYx
MjlmN2E3NzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9n
c3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRh
ci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0Y2YyZTJkODIwNGU1NGJhOGFmOTUxOWE4Yjli
N2ZmYTZlOTUxYTcwODdhZmEwZGZlODNjMTI1ZDQ5YmJiNWZiIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjEzNzc2ZmMxNmY3Y2U1ODdkNDM3ZDU2ZDgzZTA4YzkyMjQ3NjhkZGRjODk3ZGQzYzg4MjA4
ZDk3MGE2YWE0MjIiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIu
NDQuMQoK

--===============9067776016434172931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 965352 to 965544 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 537489 to 538151 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.11.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.10" to "1.24.11"

--===============9067776016434172931==--

