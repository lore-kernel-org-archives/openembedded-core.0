Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A054CD8C86
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1552.1780328129481884145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dqyxk0kW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OutY7xx5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d36ac7-73f1a05c-5b24-455c-800f-9dcce02bfab5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vaQPWPuU3iGn7YkA99thf2rODUej7+pEttKcJ3P+D3E=;
	b=dqyxk0kWpEHEToO9tmQsowf842uP+Ng+MEOsAlim0VwZy0LLa/Kq3F/I0C+/9kId
	ArLe0a52oRArSUlSP8sA1Tq4ib0LffRySndp/Y9CyYht52A13XCDL1DarPPd/TZKDHZ
	35o+LWmM+VxE8DfsmSnoFrWePm33fdvkDHa9V7ao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vaQPWPuU3iGn7YkA99thf2rODUej7+pEttKcJ3P+D3E=;
	b=OutY7xx5cNAp92Eh7DxC3otl/7Pdtbt7iOOImpG2b2TXLW/k7fxMBB5FNvGyVWxr
	cxjH3f734y4Ms1I5EKPpL2WKu00vDqoigw5kNX8iUfAP45cXDx4WylS9fkrxpG97Nlx
	xCM/9FtPk6WkrC0ljPHjFaQR4vGSXHeXhHsbcchM=
Content-Type: multipart/mixed; boundary="===============6627572261635451545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xev,mkfontscale: upgrading to 1.2.7,1.2.4 SUCCEEDED
Message-ID: <0101019e83d36ac7-73f1a05c-5b24-455c-800f-9dcce02bfab5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237849

--===============6627572261635451545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xev,mkfontscale* to *1.2.7,1.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xev-mkfontscale-upgrade-1.2.6-1.2.7-1.2.3-1.2.4.patch
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
From ce1fbfb6bdbab6c0752ac9bee0feefd157346f2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 06:43:04 +0000
Subject: [PATCH] xev,mkfontscale: upgrade 1.2.6 -> 1.2.7,1.2.3 -> 1.2.4

---
 .../xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb}     | 2 +-
 meta/recipes-graphics/xorg-app/{xev_1.2.6.bb => xev_1.2.7.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb} (88%)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.6.bb => xev_1.2.7.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
index aa79902a34..42867db65d 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
@@ -18,4 +18,4 @@ BBCLASSEXTEND = "native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
+SRC_URI[sha256sum] = "a01492a17a9b6c0ee3f92ee578850e305315b9f298da5f006a1cd4b51db01a5e"
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.6.bb b/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.6.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.7.bb
index 182aeff1b7..6e866b8f8c 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
+SRC_URI[sha256sum] = "95167895924de58e34b1013b2b0c8476e90d0888c6c39e7ae9bc35e3a19dba04"
 
 SRC_URI_EXT = "xz"
-- 
2.47.1


--===============6627572261635451545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xev-mkfontscale-upgrade-1.2.6-1.2.7-1.2.3-1.2.4.patch"

RnJvbSBjZTFmYmZiNmJkYmFiNmMwNzUyYWM5YmVlMGZlZWZkMTU3MzQ2ZjJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNjo0MzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhl
dixta2ZvbnRzY2FsZTogdXBncmFkZSAxLjIuNiAtPiAxLjIuNywxLjIuMyAtPiAxLjIuNAoKLS0t
CiAuLi4veG9yZy1hcHAve21rZm9udHNjYWxlXzEuMi4zLmJiID0+IG1rZm9udHNjYWxlXzEuMi40
LmJifSAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hldl8xLjIu
Ni5iYiA9PiB4ZXZfMS4yLjcuYmJ9ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAve21rZm9udHNjYWxlXzEuMi4zLmJiID0+IG1rZm9udHNjYWxlXzEuMi40LmJifSAoODgl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGV2XzEuMi42LmJiID0+
IHhldl8xLjIuNy5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAvbWtmb250c2NhbGVfMS4yLjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjQu
YmIKaW5kZXggYWE3OTkwMmEzNC4uNDI4NjdkYjY1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuNC5iYgpAQCAtMTgsNCArMTgsNCBA
QCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTVhNjBjNTk2ZDFiNWYzZGVlOWYwMDViNzAzYjMxODBkIgogCiBTUkNfVVJJX0VY
VCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTIxY2RjMzQ0ZjFhY2VlMDRiY2Q2ZWEx
ZTI5NTY1YzEzMDgyNjMwMDZlMTM0YTllZTM4Y2Y5YzlkNmZlNzVlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImEwMTQ5MmExN2E5YjZjMGVlM2Y5MmVlNTc4ODUwZTMwNTMxNWI5ZjI5OGRhNWYwMDZh
MWNkNGI1MWRiMDFhNWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAveGV2XzEuMi42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hldl8xLjIu
Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveGV2XzEuMi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAveGV2XzEuMi43LmJiCmluZGV4IDE4MmFlZmYxYjcuLjZlODY2YjhmOGMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4yLjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hldl8xLjIuNy5iYgpAQCAtMTIsNiArMTIs
NiBAQCBQRSA9ICIxIgogCiBERVBFTkRTICs9ICJsaWJ4cmFuZHIgeG9yZ3Byb3RvIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNjFlMWM1ZTAwOGFjOTk3M2FjYTdjZGRkZjM2ZTlkZjc0MTBlNzcw
ODNiMDMwZWIwNGY0ZGM3MzdjNTE4MDdkNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NTE2Nzg5
NTkyNGRlNThlMzRiMTAxM2IyYjBjODQ3NmU5MGQwODg4YzZjMzllN2FlOWJjMzVlM2ExOWRiYTA0
IgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKLS0gCjIuNDcuMQoK

--===============6627572261635451545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.4.tar.xz"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 106136 to 106400 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGSIZE changed from 10302 to 10284 (-0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 74994 to 75264 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: FILELIST: directory renamed /usr/src/debug/mkfontscale/1.2.3 -> /usr/src/debug/mkfontscale/1.2.4
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/xev: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev: SRC_URI changed from "https://www.x.org/releases//individual/app/xev-1.2.6.tar.xz" to "https://www.x.org/releases//individual/app/xev-1.2.7.tar.xz"
packages/x86-64-v3-poky-linux/xev/xev-dbg: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-dbg: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev-dbg: PKGSIZE changed from 79864 to 81888 (+3%)
packages/x86-64-v3-poky-linux/xev/xev-dev: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-dev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev-doc: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-doc: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev-doc: PKGSIZE changed from 2734 to 2975 (+9%)
packages/x86-64-v3-poky-linux/xev/xev-locale: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-locale: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev-src: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-src: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev-src: PKGSIZE changed from 46902 to 48207 (+3%)
packages/x86-64-v3-poky-linux/xev/xev-src: FILELIST: directory renamed /usr/src/debug/xev/1.2.6 -> /usr/src/debug/xev/1.2.7
packages/x86-64-v3-poky-linux/xev/xev-staticdev: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev-staticdev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/x86-64-v3-poky-linux/xev/xev: PV changed from "1.2.6" to "1.2.7"
packages/x86-64-v3-poky-linux/xev/xev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]

--===============6627572261635451545==--

