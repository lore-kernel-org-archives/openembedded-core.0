Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49E1C54E5F
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20171.1708018346150775017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E7nFOTjS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q4bXijxK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dadd3ab93-08b841df-f010-425a-a2e3-0981aa0e3781-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FUQXEsZAU+mtsIucEyOMIUK1to+Jzo2MmoI76bAMzCM=;
	b=E7nFOTjS939SmK0SGyXPqBEU1oix5ZrxweumwKfYQdR5tXMVkRLwEIrj3l8jeUaY
	NM9xSz1x0sjDD75zPd4esXUnaAn1BJyWDJgZz8fsGPfOj5ScCe3SOUiopEgNvSGcDOa
	A56RHfLRJTa94yPo/wM0jk7ZLaolLCR8KqE9jeQs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FUQXEsZAU+mtsIucEyOMIUK1to+Jzo2MmoI76bAMzCM=;
	b=Q4bXijxK/S8aSXx/BP/wCK3J9sNzV6rBqfeWS32KLmQeQBn8wnvHJ3kRQopODlnQ
	L3tuumuGGRSRuUA+ZqHTCuoh59wZiegnl2hsbSqwxxULVSuBRdvdGB/YiGrac06CTfw
	MxKBB7+WM3z+pBRF+sB00IbleOYvIlCb1PW4HQII=
Content-Type: multipart/mixed; boundary="===============5890302986395674841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.22.10 SUCCEEDED
Message-ID: <0101018dadd3ab93-08b841df-f010-425a-a2e3-0981aa0e3781-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195639

--===============5890302986395674841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.22.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.22.9-1.22.10.patch
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
From 492b9babd905ff987e9525003f0a7a6db19201d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 15:10:27 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.22.9 -> 1.22.10

---
 ...gins-ugly_1.22.9.bb => gstreamer1.0-plugins-ugly_1.22.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.9.bb => gstreamer1.0-plugins-ugly_1.22.10.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
index 722f8e9fe3..7cbbf9fda0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "0bf685d66015a01dd3fc1671b64a1c8acb321dd9d4ab9e05a29ab19782aa6236"
+SRC_URI[sha256sum] = "cc80a81a22c0b3b31ab7f1b8bf18dda23c72d2791b86cc6264923a68336329ea"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.42.0


--===============5890302986395674841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.22.9-1.22.10.patch"

RnJvbSA0OTJiOWJhYmQ5MDVmZjk4N2U5NTI1MDAzZjBhN2E2ZGIxOTIwMWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTU6MTA6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5OiB1cGdyYWRlIDEuMjIuOSAtPiAxLjIyLjEwCgotLS0K
IC4uLmdpbnMtdWdseV8xLjIyLjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIy
LjEwLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjIyLjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjIyLjEwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuOS5iYiBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuMTAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yMi45LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
dWdseV8xLjIyLjEwLmJiCmluZGV4IDcyMmY4ZTlmZTMuLjdjYmJmOWZkYTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11
Z2x5XzEuMjIuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIyLjEwLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19V
UkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRhci54eiBcCiAgICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwYmY2ODVkNjYwMTVhMDFkZDNmYzE2
NzFiNjRhMWM4YWNiMzIxZGQ5ZDRhYjllMDVhMjlhYjE5NzgyYWE2MjM2IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNjODBhODFhMjJjMGIzYjMxYWI3ZjFiOGJmMThkZGEyM2M3MmQyNzkxYjg2Y2M2
MjY0OTIzYTY4MzM2MzI5ZWEiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy11Z2x5LSR7
UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============5890302986395674841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGSIZE changed from 1192040 to 1192080 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.10.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.22.9" to "1.22.10"

--===============5890302986395674841==--

