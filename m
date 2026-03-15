Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4B5F013D5
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28792.1773582111961139341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R6cBnWuB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wO5gvw2X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb882e-97e7c9c1-be79-4052-89fa-10aa021a03c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QvK55ek62FX+j7dGM6Z8oVT5gtehVWYDRCOQBNoIL1M=;
	b=R6cBnWuBantrmPNuGCSroFSSkYek85AzZEZAnEQf8UHUdD/tfb4P33bRJE/yCcfI
	SY1YFHMyqyVSraa/Ip81hshsU4KBbU+cx86h6GqJKKIntTl3Kg4btdixrl7gOEX64nT
	GwSpNpHtL0Rc/xuRg5uAUPW9l7pvSVo2S6lB6Kkg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QvK55ek62FX+j7dGM6Z8oVT5gtehVWYDRCOQBNoIL1M=;
	b=wO5gvw2X4bbY3w8RyaW/dRQA2O4GZndGIEwMMEmbvBQ1+FJcvrKm3hOZNU1b10uZ
	yiyJe09zRDkz2/IKN5ive45OmJ+29qHDT1zHUp0PCGbPm5ObPp61i+oBElb/xAGGduU
	eL0yU1p2PXj7haa46bNwwcTMLoEya0B3zCCnj/0M=
Content-Type: multipart/mixed; boundary="===============4118588898546355180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpciaccess: upgrading to 0.19 SUCCEEDED
Message-ID: <0101019cf1bb882e-97e7c9c1-be79-4052-89fa-10aa021a03c9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233177

--===============4118588898546355180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpciaccess* to *0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpciaccess-upgrade-0.18.1-0.19.patch
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
From 2017533d642f62b90a4754641fd00f0bd500e68a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 10:58:26 +0000
Subject: [PATCH] libpciaccess: upgrade 0.18.1 -> 0.19

---
 .../xorg-lib/{libpciaccess_0.18.1.bb => libpciaccess_0.19.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.18.1.bb => libpciaccess_0.19.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
index 7bcf51d56f..428dffad81 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
 DEPENDS = "util-macros"
 
 SRC_URI = "${XORG_MIRROR}/individual/lib/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4af43444b38adb5545d0ed1c2ce46d9608cc47b31c2387fc5181656765a6fa76"
+SRC_URI[sha256sum] = "3c55aa86c82e54a4e3109786f0463530d53b36b6d1cfd14616454f985dd2aa43"
 
 inherit pkgconfig meson
 
-- 
2.47.1


--===============4118588898546355180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpciaccess: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess: SRC_URI changed from "https://www.x.org/releases//individual/lib/libpciaccess-0.18.1.tar.xz" to "https://www.x.org/releases//individual/lib/libpciaccess-0.19.tar.xz"
packages/x86-64-v3-poky-linux/libpciaccess: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dbg: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dbg: PKGSIZE changed from 128736 to 130288 (+1%)
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dbg: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dev: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dev: PKGSIZE changed from 15766 to 15868 (+1%)
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-dev: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-doc: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-doc: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-locale: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-locale: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-src: FILELIST: directory renamed /usr/src/debug/libpciaccess/0.18.1/src -> /usr/src/debug/libpciaccess/0.19/src, directory renamed /usr/src/debug/libpciaccess/0.18.1/include -> /usr/src/debug/libpciaccess/0.19/include
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-src: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-src: PKGSIZE changed from 124599 to 126181 (+1%)
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-src: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-staticdev: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess-staticdev: PV changed from "0.18.1" to "0.19"
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/libpciaccess/libpciaccess: PV changed from "0.18.1" to "0.19"

--===============4118588898546355180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpciaccess-upgrade-0.18.1-0.19.patch"

RnJvbSAyMDE3NTMzZDY0MmY2MmI5MGE0NzU0NjQxZmQwMGYwYmQ1MDBlNjhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTA6NTg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY2lhY2Nlc3M6IHVwZ3JhZGUgMC4xOC4xIC0+IDAuMTkKCi0tLQogLi4uL3hvcmctbGliL3ts
aWJwY2lhY2Nlc3NfMC4xOC4xLmJiID0+IGxpYnBjaWFjY2Vzc18wLjE5LmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJwY2lhY2Nlc3NfMC4xOC4xLmJiID0+IGxp
YnBjaWFjY2Vzc18wLjE5LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3NfMC4xOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzc18wLjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3NfMC4x
OC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNpYWNj
ZXNzXzAuMTkuYmIKaW5kZXggN2JjZjUxZDU2Zi4uNDI4ZGZmYWQ4MSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzc18wLjE4LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzc18wLjE5LmJiCkBAIC0x
Miw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTU0Yzk3
ODk2OGU1NjUyMThlZWEzNmNmMDNlZjI0MzUyIgogREVQRU5EUyA9ICJ1dGlsLW1hY3JvcyIKIAog
U1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlkdWFsL2xpYi8ke0JQfS50YXIueHoiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGFmNDM0NDRiMzhhZGI1NTQ1ZDBlZDFjMmNlNDZkOTYwOGNj
NDdiMzFjMjM4N2ZjNTE4MTY1Njc2NWE2ZmE3NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYzU1
YWE4NmM4MmU1NGE0ZTMxMDk3ODZmMDQ2MzUzMGQ1M2IzNmI2ZDFjZmQxNDYxNjQ1NGY5ODVkZDJh
YTQzIgogCiBpbmhlcml0IHBrZ2NvbmZpZyBtZXNvbgogCi0tIAoyLjQ3LjEKCg==

--===============4118588898546355180==--

