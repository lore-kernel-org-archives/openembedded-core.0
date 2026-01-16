Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1C0D489BF
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1476.1768526750130714605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IJwCPFsy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jXcB8Yre;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc468bd18-18f6fe93-8dab-4ceb-962a-005ea06fe2de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5LVPXuUR0yNJMR5DZIBsvFJKs0RyvmCau7WA0ZBducs=;
	b=IJwCPFsygYer+60GWuczxPOU32SEMqbBECzitfCQCplxohtD9DCOSoqNWxpVDtdM
	2OcRGlb7UBIW653HZTePzsJbnG+V0pKRKkNi7Qt5IC1KzSxFQKUA+RZHtAriJJQjkP6
	3S+6gMu+SI4y08uNMjm5gT7KKhmenaUhUO72CGg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5LVPXuUR0yNJMR5DZIBsvFJKs0RyvmCau7WA0ZBducs=;
	b=jXcB8YrevYo0oh6ZcCYeiXDd2/clfOG8PXv4xA29riqxlBC2L2d3O8UyAJdPMPTd
	DWfW1wZGAyPHvHUsOjVzXQUsDCl8sbYHh0ZFGm6LN3JRggqCbkYFqVFilmqC+t+IDqv
	T9/bdblzF0xaXfg1PnrMI/PiMRtRWplx7VOEWG4w=
Content-Type: multipart/mixed; boundary="===============8841439603925689327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.4 SUCCEEDED
Message-ID: <0101019bc468bd18-18f6fe93-8dab-4ceb-962a-005ea06fe2de-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229504

--===============8841439603925689327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.3-1.33.4.patch
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
From 7603571528d1804617fa75b005420950a9c26869 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:50:56 +0000
Subject: [PATCH] mpg123: upgrade 1.33.3 -> 1.33.4

---
 .../mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
index b1897fe95d..648eb21500 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26"
+SRC_URI[sha256sum] = "3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============8841439603925689327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.3.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.4.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2389168 to 2389432 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.33.3/src/libout123/modules -> /usr/src/debug/mpg123/1.33.4/src/libout123/modules, directory renamed /usr/src/debug/mpg123/1.33.3/src/libout123 -> /usr/src/debug/mpg123/1.33.4/src/libout123, directory renamed /usr/src/debug/mpg123/1.33.3/src/libmpg123 -> /usr/src/debug/mpg123/1.33.4/src/libmpg123, directory renamed /usr/src/debug/mpg123/1.33.3/src/libsyn123 -> /usr/src/debug/mpg123/1.33.4/src/libsyn123, directory renamed /usr/src/debug/mpg123/1.33.3/src -> /usr/src/debug/mpg123/1.33.4/src, directory renamed /usr/src/debug/mpg123/1.33.3/src/include -> /usr/src/debug/mpg123/1.33.4/src/include, directory renamed /usr/src/debug/mpg123/1.33.3/src/common -> /usr/src/debug/mpg123/1.33.4/src/common, directory renamed /usr/src/debug/mpg123/1.33.3/src/compat -> /usr/src/debug/mpg123/1.33.4/src/compat
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1915330 to 1916492 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.3 [default] to 1.33.4 [default]

--===============8841439603925689327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.3-1.33.4.patch"

RnJvbSA3NjAzNTcxNTI4ZDE4MDQ2MTdmYTc1YjAwNTQyMDk1MGE5YzI2ODY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6NTA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMy4zIC0+IDEuMzMuNAoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMy4zLmJiID0+IG1wZzEyM18xLjMzLjQuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMzLjMuYmIgPT4gbXBnMTIzXzEuMzMu
NC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzMuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMy40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzMuNC5iYgppbmRleCBiMTg5N2ZlOTVkLi42NDhl
YjIxNTAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzMuNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YTBjNjQ3MmRkMTU2ZTIxM2My
MDY4ZjQwMTE1ZWJiYjczOTc4YzJkODczZTY2YmFlMmEyNTBlMmQyMTk4ZDI2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjNhZThjOWZmODBhOTdiZmMwZTIyZTg5ZmJjZDc0Njg3ZWNhNGZjMWRiMzE1
YjEyNjA3ZjI3ZjAxY2I1YTQ3ZDkiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============8841439603925689327==--

