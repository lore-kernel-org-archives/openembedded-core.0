Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE61EC2BA15
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18364.1718475798373015591
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fC48xnVl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=K7oYB5Ur;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23b429-10ea67b6-13ce-474b-9339-d87df4164a76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475797;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I+r5mNrxcP7l1+wEOrFQnQubYHJQ9wSdKS18YNwu7C0=;
	b=fC48xnVltiL9wdth83gKr5nFPM3Ern+Wsws1xdTrJHWnIFUoOYztW/KuTQqG3Dr1
	J5YH1E0yuruinisCs/aIhfp59E+xqswSAqbm3VgYaEp/UjWG63DPWXzaYDjydie6IrK
	w6F0pp9Z03jd9/XQprRrmYOG5ivmgkea42Ox0waE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475797;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I+r5mNrxcP7l1+wEOrFQnQubYHJQ9wSdKS18YNwu7C0=;
	b=K7oYB5UrI9oRBv0k03d3eQeJdcTTM2DgZULD/dH3+egVIR059p1wgSGyeG+kvw6c
	CxnEPZ8AK6/mbkeKEiLyxmqTuEHqOBnEkYfD3TkKc/8/k4jfCh5hRhBgdQgP9jHfIH0
	h12LikvbltMz5LzRaUpXE6UNLNS+GCpqbfso2FAM=
Content-Type: multipart/mixed; boundary="===============4341659546830839607=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.13.0 SUCCEEDED
Message-ID: <010101901d23b429-10ea67b6-13ce-474b-9339-d87df4164a76-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200671

--===============4341659546830839607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pciutils* to *3.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pciutils-upgrade-3.12.0-3.13.0.patch
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
From 08edc4a1c40b404585e0876d7d7efad176ed9e0a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 05:05:38 +0000
Subject: [PATCH] pciutils: upgrade 3.12.0 -> 3.13.0

---
 .../pciutils/{pciutils_3.12.0.bb => pciutils_3.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.12.0.bb => pciutils_3.13.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
index 2db0895bf4..0b876c7070 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f185d116d5ff99b797497efce8f19f1ee8ccc5a668b97a159e3d13472f674154"
+SRC_URI[sha256sum] = "77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.44.0


--===============4341659546830839607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.12.0", added "/usr/lib/libpci.so.3.13.0"
Changes to packages/core2-64-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.12.0 to libpci.so.3.13.0
  /usr/lib/libpci.so.3.12.0 moved to /usr/lib/libpci.so.3.13.0

--===============4341659546830839607==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pciutils-upgrade-3.12.0-3.13.0.patch"

RnJvbSAwOGVkYzRhMWM0MGI0MDQ1ODVlMDg3NmQ3ZDdlZmFkMTc2ZWQ5ZTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDU6MDU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
Y2l1dGlsczogdXBncmFkZSAzLjEyLjAgLT4gMy4xMy4wCgotLS0KIC4uLi9wY2l1dGlscy97cGNp
dXRpbHNfMy4xMi4wLmJiID0+IHBjaXV0aWxzXzMuMTMuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ic3AvcGNpdXRpbHMve3BjaXV0aWxzXzMuMTIuMC5iYiA9PiBwY2l1dGlsc18zLjEz
LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1
dGlsc18zLjEyLjAuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuMTMu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3Bj
aXV0aWxzL3BjaXV0aWxzXzMuMTIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC9wY2l1
dGlscy9wY2l1dGlsc18zLjEzLjAuYmIKaW5kZXggMmRiMDg5NWJmNC4uMGI4NzZjNzA3MCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjEyLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjEzLjAuYmIKQEAgLTEyLDcg
KzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NzUxNDE5MjYw
YWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUiCiBERVBFTkRTID0gIm1ha2UtbmF0aXZlIgogCiBTUkNf
VVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvdXRpbHMvcGNpdXRpbHMvcGNpdXRp
bHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxODVkMTE2ZDVmZjk5Yjc5
NzQ5N2VmY2U4ZjE5ZjFlZThjY2M1YTY2OGI5N2ExNTllM2QxMzQ3MmY2NzQxNTQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNzdmMTFmNzgyOTg1MDI2MzRkMWFmNTAzMDhmMTVhNTc4ODYyOWY2Y2Y0
NWNiYTM3NmY1MDA5YWVhNGNiNDkyNiIKIAogaW5oZXJpdCBtdWx0aWxpYl9oZWFkZXIgcGtnY29u
ZmlnIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40NC4wCgo=

--===============4341659546830839607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pciutils: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.12.0.tar.xz" to "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.13.0.tar.xz"
packages/core2-64-poky-linux/pciutils: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/libpci: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.12.0", added "/usr/lib/libpci.so.3.13.0"
packages/core2-64-poky-linux/pciutils/libpci: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PKGSIZE changed from 724384 to 748120 (+3%)
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-dbg: FILELIST: removed "/usr/lib/.debug/libpci.so.3.12.0", added "/usr/lib/.debug/libpci.so.3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-dbg: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 105118 to 106460 (+1%)
packages/core2-64-poky-linux/pciutils/pciutils-dev: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-dev: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 38212 to 40372 (+6%)
packages/core2-64-poky-linux/pciutils/pciutils-doc: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-doc: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-ids: PKGSIZE changed from 330605 to 331812 (+0%)
packages/core2-64-poky-linux/pciutils/pciutils-ids: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-ids: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-locale: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-locale: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 435861 to 448080 (+3%)
packages/core2-64-poky-linux/pciutils/pciutils-src: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-src: FILELIST: directory renamed /usr/src/debug/pciutils/3.12.0 -> /usr/src/debug/pciutils/3.13.0, directory renamed /usr/src/debug/pciutils/3.12.0/lib -> /usr/src/debug/pciutils/3.13.0/lib, removed "/usr/src/debug/pciutils/3.12.0/lmr/margin_results.c /usr/src/debug/pciutils/3.12.0/lmr/lmr.h /usr/src/debug/pciutils/3.12.0/lmr/margin_hw.c /usr/src/debug/pciutils/3.12.0/lmr/margin.c /usr/src/debug/pciutils/3.12.0/lmr/margin_log.c", added "/usr/src/debug/pciutils/3.13.0/lmr/margin_results.c /usr/src/debug/pciutils/3.13.0/lmr/lmr.h /usr/src/debug/pciutils/3.13.0/lmr/margin_hw.c /usr/src/debug/pciutils/3.13.0/lmr/margin.c /usr/src/debug/pciutils/3.13.0/lmr/margin_args.c /usr/src/debug/pciutils/3.13.0/lmr/margin_log.c"
packages/core2-64-poky-linux/pciutils/pciutils-src: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils-staticdev: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils-staticdev: PV changed from "3.12.0" to "3.13.0"
packages/core2-64-poky-linux/pciutils/pciutils: PKGSIZE changed from 186589 to 186597 (+0%)
packages/core2-64-poky-linux/pciutils/pciutils: PKGV changed from 3.12.0 [default] to 3.13.0 [default]
packages/core2-64-poky-linux/pciutils/pciutils: PV changed from "3.12.0" to "3.13.0"
Changes to packages/core2-64-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.12.0 to libpci.so.3.13.0
  /usr/lib/libpci.so.3.12.0 moved to /usr/lib/libpci.so.3.13.0

--===============4341659546830839607==--

