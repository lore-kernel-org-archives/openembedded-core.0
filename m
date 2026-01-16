Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828A7D489A4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1486.1768526757658865956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=funveE6I;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ny8T0a1x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019bc468c451-ee6929cd-8e6d-43c2-adb9-d95f5c991fc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AYddneC9mux9utkSvl+SWJ+UnoRggbVi5c2D+v3WqVk=;
	b=funveE6IkZEyfvzpl+4CQArQ9rYPNsXOS6K9lthGTZPboI6eb7TCt/dSRGU+DDeZ
	AShldGLP6FyYDm8FFHEbElRP9RrVXoq1vx4STtAl/r29EK1Aq6l7638T4M6KILFVRIl
	jC/5WWmpEzNL6hsqddXCG3Pg1e8rnag/T/bzA6DU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AYddneC9mux9utkSvl+SWJ+UnoRggbVi5c2D+v3WqVk=;
	b=ny8T0a1x1iBNNufnZo1H2NCJtZTGAil3AD2jiCzoyshcGK354BVdw3pXqlrvxuFA
	QtqeSLi75Ew+6oHH6qKkNT+WeDLaER24osufnv9k0UjBqCeCqRN0vzZujgPtJ51xvqm
	t3m9I+PmAPF4xFlncqhvfMB2AfebVgrTbgohnLac=
Content-Type: multipart/mixed; boundary="===============4009651554463308636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.4 SUCCEEDED
Message-ID: <0101019bc468c451-ee6929cd-8e6d-43c2-adb9-d95f5c991fc0-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229516

--===============4009651554463308636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.3.1-4.4.patch
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
From 388cbcd41938c633898f98d0d31e3444659050cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 01:19:25 +0000
Subject: [PATCH] re2c: upgrade 4.3.1 -> 4.4

---
 meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.1.bb b/meta/recipes-support/re2c/re2c_4.4.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.1.bb
rename to meta/recipes-support/re2c/re2c_4.4.bb
index bead73279f..3be66d1388 100644
--- a/meta/recipes-support/re2c/re2c_4.3.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.4.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
+SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============4009651554463308636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.3.1-4.4.patch"

RnJvbSAzODhjYmNkNDE5MzhjNjMzODk4Zjk4ZDBkMzFlMzQ0NDY1OTA1MGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDE6MTk6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZTJjOiB1cGdyYWRlIDQuMy4xIC0+IDQuNAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJj
L3tyZTJjXzQuMy4xLmJiID0+IHJlMmNfNC40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3JlMmMve3JlMmNfNC4zLjEuYmIgPT4gcmUyY180LjQuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMy4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcmUyYy9yZTJjXzQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjQuYmIKaW5kZXggYmVhZDczMjc5Zi4uM2JlNjZkMTM4
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMy4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjQuYmIKQEAgLTcsNyArNyw3IEBA
IExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02
NGVjYTRkOGEzYjY3ZjlkYzc2NTYwOTQ3MzFhMmM4ZCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1ZjVlOGE2MTg5NjBmNjhiYjQ2ZWU4NzI4ZWNkNDEzMmUxMjc1YjU5NWNmYzdh
NDg0NzZmOTc3YWZkMDFkMGNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiNmI4NjU5MjQ0NDdl
Zjk5MmQ1ZGI0ZTUyZmI5MzA3ZTVmNjVmMjZlZGQ0M2VmYTkxMzk1ZGE4MTBmNDI4MGEiCiBHSVRI
VUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NrdmFkcmlrL3JlMmMvcmVsZWFzZXMi
CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============4009651554463308636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.3.1/re2c-4.3.1.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.4/re2c-4.4.tar.xz"
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 198303864 to 197102112 (-1%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1841767 to 1850085 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.3.1/src/adfa -> /usr/src/debug/re2c/4.4/src/adfa, directory renamed /usr/src/debug/re2c/4.3.1/src/skeleton -> /usr/src/debug/re2c/4.4/src/skeleton, directory renamed /usr/src/debug/re2c/4.3.1/src/test/range -> /usr/src/debug/re2c/4.4/src/test/range, directory renamed /usr/src/debug/re2c/4.3.1/src/nfa -> /usr/src/debug/re2c/4.4/src/nfa, directory renamed /usr/src/debug/re2c/4.3.1/src/dfa -> /usr/src/debug/re2c/4.4/src/dfa, directory renamed /usr/src/debug/re2c/4.3.1/src/cfg -> /usr/src/debug/re2c/4.4/src/cfg, directory renamed /usr/src/debug/re2c/4.3.1/src/msg -> /usr/src/debug/re2c/4.4/src/msg, directory renamed /usr/src/debug/re2c/4.3.1/src/encoding -> /usr/src/debug/re2c/4.4/src/encoding, directory renamed /usr/src/debug/re2c/4.3.1/src/debug -> /usr/src/debug/re2c/4.4/src/debug, directory renamed /usr/src/debug/re2c/4.3.1/src/options -> /usr/src/debug/re2c/4.4/src/options, directory renam
 ed /usr/src/debug/re2c/4.3.1/src/parse -> /usr/src/debug/re2c/4.4/src/parse, directory renamed /usr/src/debug/re2c/4.3.1/src/regexp -> /usr/src/debug/re2c/4.4/src/regexp, directory renamed /usr/src/debug/re2c/4.3.1/src/codegen -> /usr/src/debug/re2c/4.4/src/codegen, directory renamed /usr/src/debug/re2c/4.3.1/src -> /usr/src/debug/re2c/4.4/src, directory renamed /usr/src/debug/re2c/4.3.1/src/util -> /usr/src/debug/re2c/4.4/src/util
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1763991 to 1769258 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 12643460 to 12645009 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.3.1" to "4.4"

--===============4009651554463308636==--

