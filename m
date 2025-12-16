Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5904D609A5
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17404.1765872149942206345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0ohOr+kP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VWMvDesh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ef5e2-14930b38-f06e-4418-badf-f942c0d1cc0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WhaNR/IcuEmgKCQ53LOnH3SQ6OlKjLJbfRpoELK21LY=;
	b=0ohOr+kPL27AQ01GlzgIootcLODjgUFC6kH+Z20ynEi/W4Cv6nFeawvcypSm6oj6
	vRBuJRr8R3DEWH3rcD9XuRdQ8cVR3XdcdfdU3NUOTuoPS+JxC97NeI5ICqODsGe9b8U
	FL3eHA5QS6OAgxQ1/569kdHakQ//humotTl+XTYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WhaNR/IcuEmgKCQ53LOnH3SQ6OlKjLJbfRpoELK21LY=;
	b=VWMvDeshNLgTuojHIne/M4vajS2VbJI1TXffOQlymN2EDzueoCz6HKOkL2Q07J9E
	4jMDaRQ5HhjhGIaR+18ogkFiwF4b2/1Zff1djhs0ft9Y2O5ykR1hO7SgR3eusEc4ivt
	nmBorR1P7EwOkm7ZtuzNavlCnQMPYzXdVOa2WGQY=
Content-Type: multipart/mixed; boundary="===============3998794971041794323=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.3.1 SUCCEEDED
Message-ID: <0101019b262ef5e2-14930b38-f06e-4418-badf-f942c0d1cc0e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227923

--===============3998794971041794323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.3-4.3.1.patch
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
From fe451cdc418354ea2acac7aaa6a5b60772a50189 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:59:24 +0000
Subject: [PATCH] re2c: upgrade 4.3 -> 4.3.1

---
 meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.bb b/meta/recipes-support/re2c/re2c_4.3.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.bb
rename to meta/recipes-support/re2c/re2c_4.3.1.bb
index eafdf93078..bead73279f 100644
--- a/meta/recipes-support/re2c/re2c_4.3.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "51e88d6d6b6ab03eb7970276aca7e0db4f8e29c958b84b561d2fdcb8351c7150"
+SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============3998794971041794323==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.3-4.3.1.patch"

RnJvbSBmZTQ1MWNkYzQxODM1NGVhMmFjYWM3YWFhNmE1YjYwNzcyYTUwMTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6NTk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZTJjOiB1cGdyYWRlIDQuMyAtPiA0LjMuMQoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJj
L3tyZTJjXzQuMy5iYiA9PiByZTJjXzQuMy4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3JlMmMve3JlMmNfNC4zLmJiID0+IHJlMmNfNC4zLjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3JlMmMvcmUyY180LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLjEuYmIKaW5kZXggZWFmZGY5MzA3OC4uYmVhZDczMjc5
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLjEuYmIKQEAgLTcsNyArNyw3IEBA
IExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02
NGVjYTRkOGEzYjY3ZjlkYzc2NTYwOTQ3MzFhMmM4ZCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1MWU4OGQ2ZDZiNmFiMDNlYjc5NzAyNzZhY2E3ZTBkYjRmOGUyOWM5NThiODRi
NTYxZDJmZGNiODM1MWM3MTUwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVmNWU4YTYxODk2MGY2
OGJiNDZlZTg3MjhlY2Q0MTMyZTEyNzViNTk1Y2ZjN2E0ODQ3NmY5NzdhZmQwMWQwY2MiCiBHSVRI
VUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NrdmFkcmlrL3JlMmMvcmVsZWFzZXMi
CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============3998794971041794323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.3/re2c-4.3.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.3.1/re2c-4.3.1.tar.xz"
packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 196955888 to 198303864 (+1%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1841512 to 1841767 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1761079 to 1763991 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.3/src/adfa -> /usr/src/debug/re2c/4.3.1/src/adfa, directory renamed /usr/src/debug/re2c/4.3/src -> /usr/src/debug/re2c/4.3.1/src, directory renamed /usr/src/debug/re2c/4.3/src/nfa -> /usr/src/debug/re2c/4.3.1/src/nfa, directory renamed /usr/src/debug/re2c/4.3/src/debug -> /usr/src/debug/re2c/4.3.1/src/debug, directory renamed /usr/src/debug/re2c/4.3/src/cfg -> /usr/src/debug/re2c/4.3.1/src/cfg, directory renamed /usr/src/debug/re2c/4.3/src/util -> /usr/src/debug/re2c/4.3.1/src/util, directory renamed /usr/src/debug/re2c/4.3/src/encoding -> /usr/src/debug/re2c/4.3.1/src/encoding, directory renamed /usr/src/debug/re2c/4.3/src/skeleton -> /usr/src/debug/re2c/4.3.1/src/skeleton, directory renamed /usr/src/debug/re2c/4.3/src/msg -> /usr/src/debug/re2c/4.3.1/src/msg, directory renamed /usr/src/debug/re2c/4.3/src/test/range -> /usr/src/debug/re2c/4.3.1/src/test/range, directory renamed /usr/src/de
 bug/re2c/4.3/src/codegen -> /usr/src/debug/re2c/4.3.1/src/codegen, directory renamed /usr/src/debug/re2c/4.3/src/regexp -> /usr/src/debug/re2c/4.3.1/src/regexp, directory renamed /usr/src/debug/re2c/4.3/src/options -> /usr/src/debug/re2c/4.3.1/src/options, directory renamed /usr/src/debug/re2c/4.3/src/parse -> /usr/src/debug/re2c/4.3.1/src/parse, directory renamed /usr/src/debug/re2c/4.3/src/dfa -> /usr/src/debug/re2c/4.3.1/src/dfa
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.3" to "4.3.1"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 12553222 to 12643460 (+1%)
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.3" to "4.3.1"

--===============3998794971041794323==--

