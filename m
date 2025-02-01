Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C80C021A5
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.42736.1738416069821817986
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EFygz/H8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=l8EgtiS1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194c1ac185b-8b98d3a0-c69a-4a9e-a845-a23707690297-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416069;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jt6oQ04Bw6y2GdH960Gqtl8uVYOOJKl8Ct6BnBuc7Kc=;
	b=EFygz/H8VNs/KEZvFj+J1OtulZ6al668q1EOhPWD2pLirl31dsEBWpFUs9nnGAPB
	Bzq465eH3/sngSeXO16Hry9Te9PxNrt2t10aN4ey8QmYjMR4OdK+6n9iHcRaVMJPbGA
	yrg7YEV8hV7xXscsAR1K1XDXojSem4nhDF6Ifg78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416069;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jt6oQ04Bw6y2GdH960Gqtl8uVYOOJKl8Ct6BnBuc7Kc=;
	b=l8EgtiS1yOsMJfdPJiX1LgE9tN1PO1ip6kzuMVYjvZZkZFP62qECBIRU92hKx4hO
	05bAwxe/or/0BmMm40iClS53TGkqbqdchEhjubrNXx7VOW8KbefEWFnATs0knzPS+Vz
	veI4o+TFA88dUY0p8OxKPy1eew/12d2suKZv9SUA=
Content-Type: multipart/mixed; boundary="===============6525716349037402788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.12 SUCCEEDED
Message-ID: <01010194c1ac185b-8b98d3a0-c69a-4a9e-a845-a23707690297-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210594

--===============6525716349037402788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.24.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.10-1.24.12.patch
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
From cf5604ffa00158ddc0558a6d82290930288ea30e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 12:45:02 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.10 -> 1.24.12

---
 ...reamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.12.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
index 629e9516c3..77c10da39e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
+SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.1


--===============6525716349037402788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 965352 to 966488 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 537489 to 539184 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.10" to "1.24.12"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.10 [default] to 1.24.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.12.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.10" to "1.24.12"

--===============6525716349037402788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.10-1.24.12.patch"

RnJvbSBjZjU2MDRmZmEwMDE1OGRkYzA1NThhNmQ4MjI5MDkzMDI4OGVhMzBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMjo0NTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI0LjEwIC0+IDEuMjQuMTIKCi0tLQogLi4ucmVh
bWVyMS4wLWxpYmF2XzEuMjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuMTIuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtbGli
YXZfMS4yNC4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNC4xMi5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LWxpYmF2XzEuMjQuMTAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2XzEuMjQuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8x
LjI0LjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2XzEuMjQuMTIuYmIKaW5kZXggNjI5ZTk1MTZjMy4uNzdjMTBkYTM5ZSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1saWJhdl8xLjI0LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yNC4xMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEy
OWY3YTc3MCBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dz
dHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFy
Lnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjZjJlMmQ4MjA0ZTU0YmE4YWY5NTE5YThiOWI3
ZmZhNmU5NTFhNzA4N2FmYTBkZmU4M2MxMjVkNDliYmI1ZmIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZWY3MmMxYzcwYTE3YjNjMGJiMjgzZDE2ZDA5YWJhNDk2ZDM0MDFjOTI3ZGNmNTM5MmE4YTc4
NjZkOTMzNjM3OSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi40
NC4xCgo=

--===============6525716349037402788==--

