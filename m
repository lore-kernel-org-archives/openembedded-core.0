Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7F5CD98ED
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50407.1781195495833571318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tb4KHEjv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y+u1rPjZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786bd3d-04fae389-7051-4cf7-9cb0-659fecbeda1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D9+qMWupcQplfNisl9IrcrxbTTwfecuzZs+5NMI3Kn4=;
	b=Tb4KHEjv9H6k6QaTanONY8P+C9wv2f4LjSSjHpODN0aVT5rMVyj/b5PcMNwP49iN
	LiZrDscHajhYc/N169sBbwKQQPGn21yNfW8f7NwFJcgglLntkpOrQA0cknJN86s1w5+
	bOpRGTKG5YvF5fjl0Y8zu/zb453Y21Agw3dh54hk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D9+qMWupcQplfNisl9IrcrxbTTwfecuzZs+5NMI3Kn4=;
	b=Y+u1rPjZqkkZsi575qg9OOz1suuxPowPnCCi3oDlPdWlBBLX9D7PKE6HOjQv9ZHp
	zUpTqBem7YuXiFfWCBsVMTohRY1glRyz0/CxwkT/mpj62SAvEZfpEAlzq11tjqfUxV4
	WKMhwj9UxxSJDMbJ/zmjpuhaZTiZFHRKGP7yddM8=
Content-Type: multipart/mixed; boundary="===============8751424307819874066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.6 SUCCEEDED
Message-ID: <0101019eb786bd3d-04fae389-7051-4cf7-9cb0-659fecbeda1d-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238560

--===============8751424307819874066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.5-1.33.6.patch
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
From 1a32a60ea95b98af72a43edd7ec3dc5b545e626d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 14:08:19 +0000
Subject: [PATCH] mpg123: upgrade 1.33.5 -> 1.33.6

---
 .../mpg123/{mpg123_1.33.5.bb => mpg123_1.33.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.5.bb => mpg123_1.33.6.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
index f8c08ad1f8..f07e6dbcd3 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd"
+SRC_URI[sha256sum] = "929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============8751424307819874066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.5.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.6.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2639432 to 2640648 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1918131 to 1918426 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.33.5/src/libmpg123 -> /usr/src/debug/mpg123/1.33.6/src/libmpg123, directory renamed /usr/src/debug/mpg123/1.33.5/src/libsyn123 -> /usr/src/debug/mpg123/1.33.6/src/libsyn123, directory renamed /usr/src/debug/mpg123/1.33.5/src/libout123 -> /usr/src/debug/mpg123/1.33.6/src/libout123, directory renamed /usr/src/debug/mpg123/1.33.5/src -> /usr/src/debug/mpg123/1.33.6/src, directory renamed /usr/src/debug/mpg123/1.33.5/src/include -> /usr/src/debug/mpg123/1.33.6/src/include, directory renamed /usr/src/debug/mpg123/1.33.5/src/common -> /usr/src/debug/mpg123/1.33.6/src/common, directory renamed /usr/src/debug/mpg123/1.33.5/src/libout123/modules -> /usr/src/debug/mpg123/1.33.6/src/libout123/modules, directory renamed /usr/src/debug/mpg123/1.33.5/src/compat -> /usr/src/debug/mpg123/1.33.6/src/compat
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.5 [default] to 1.33.6 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.5" to "1.33.6"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.5 [default] to 1.33.6 [default]

--===============8751424307819874066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.5-1.33.6.patch"

RnJvbSAxYTMyYTYwZWE5NWI5OGFmNzJhNDNlZGQ3ZWMzZGM1YjU0NWU2MjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTQ6MDg6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMy41IC0+IDEuMzMuNgoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMy41LmJiID0+IG1wZzEyM18xLjMzLjYuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMzLjUuYmIgPT4gbXBnMTIzXzEuMzMu
Ni5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzMuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMy42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzMuNi5iYgppbmRleCBmOGMwOGFkMWY4Li5mMDdl
NmRiY2QzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzMuNi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZDdlYmM4ZGEwYWZmM2NhMzgz
YzhjNmI1YTZhZGJlNDAyZWU1YmIyNTY2ODViOGM1NDk5ZjNhNzM5ZjlkNmRkIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjkyOWE3YzE4YmE2NjJiODkyN2FlZDRkZTIyOWFkOWFlOGFiMmI0ODA2ZGQw
ZjMwYjkwMTEzZWIxYjRlMjE5NWEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============8751424307819874066==--

