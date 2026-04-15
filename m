Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB60F4210B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19733.1776261873500071572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cg7GXfKv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=39Vafzsq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d91753cf3-13930edf-5200-47a2-a3f5-395087df68b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x/nhValbu+0Y5XOsfa6TIMPsHfwueHoaILYTAh+AJT4=;
	b=cg7GXfKvaqneFV7luZg62MzEZx1sky/I9r3Vy1yLdW0s2+VRE9LixZolO4OQl52y
	xKjWh6BV1CSrJMbdyo2e9WSSbGf6H9vTy0OCnBAwXIJVgJhWZtd7OkqkhPcrkkn48Ec
	dCsQerL7175HK+3aNifZc1U5e9FCqeYBzt5LgLPQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x/nhValbu+0Y5XOsfa6TIMPsHfwueHoaILYTAh+AJT4=;
	b=39VafzsqMeLA+lmZfJGawp/RtPYAMUAaLa6aeJpUI46JjxpcImRwIF3Fq9geEuXe
	I8KbViII/g0tL2syJih9aS+aFlo5gnhjAKrVFkfE3EoWXEs5t0HfH3mCXaD6Rr/RqBU
	aizw5AY2PGGP3X0dBUuj/LbeEdHnlB6AR/2Ecs4g=
Content-Type: multipart/mixed; boundary="===============2244680009097159027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.15.0 SUCCEEDED
Message-ID: <0101019d91753cf3-13930edf-5200-47a2-a3f5-395087df68b6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235211

--===============2244680009097159027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pciutils* to *3.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pciutils-upgrade-3.14.0-3.15.0.patch
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
From 3755d3818dcd12ac8e46886e4d4746ab97defd07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:02:31 +0000
Subject: [PATCH] pciutils: upgrade 3.14.0 -> 3.15.0

---
 .../pciutils/{pciutils_3.14.0.bb => pciutils_3.15.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.14.0.bb => pciutils_3.15.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
index a267ea34b7..ee3dde9ae4 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f"
+SRC_URI[sha256sum] = "c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4e9f5ff"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.47.1


--===============2244680009097159027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.14.0", added "/usr/lib/libpci.so.3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 114830 to 127398 (+11%)
Changes to packages/x86-64-v3-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.14.0 to libpci.so.3.15.0
  /usr/lib/libpci.so.3.14.0 moved to /usr/lib/libpci.so.3.15.0

--===============2244680009097159027==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pciutils-upgrade-3.14.0-3.15.0.patch"

RnJvbSAzNzU1ZDM4MThkY2QxMmFjOGU0Njg4NmU0ZDQ3NDZhYjk3ZGVmZDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6MDI6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
Y2l1dGlsczogdXBncmFkZSAzLjE0LjAgLT4gMy4xNS4wCgotLS0KIC4uLi9wY2l1dGlscy97cGNp
dXRpbHNfMy4xNC4wLmJiID0+IHBjaXV0aWxzXzMuMTUuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ic3AvcGNpdXRpbHMve3BjaXV0aWxzXzMuMTQuMC5iYiA9PiBwY2l1dGlsc18zLjE1
LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1
dGlsc18zLjE0LjAuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuMTUu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3Bj
aXV0aWxzL3BjaXV0aWxzXzMuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC9wY2l1
dGlscy9wY2l1dGlsc18zLjE1LjAuYmIKaW5kZXggYTI2N2VhMzRiNy4uZWUzZGRlOWFlNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjE0LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjE1LjAuYmIKQEAgLTEyLDcg
KzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NzUxNDE5MjYw
YWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUiCiBERVBFTkRTID0gIm1ha2UtbmF0aXZlIgogCiBTUkNf
VVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvdXRpbHMvcGNpdXRpbHMvcGNpdXRp
bHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3NzEzNDA5ODgyODEzOTkx
ZDIyNjlkMTI1ZTQwZGFkMWY1NGEwMTlhNTJiNzhiMzk2Mjk0MWMxZDRhNmY4NmYiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYzAyOTQwZjQzMDg0MWVjZjE1OGQ1ZDlhNTAwMDdhZmM0ZDUzNTNjODY3
OGEyNDU1MDAzY2EwYjJjNGU5ZjVmZiIKIAogaW5oZXJpdCBtdWx0aWxpYl9oZWFkZXIgcGtnY29u
ZmlnIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40Ny4xCgo=

--===============2244680009097159027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pciutils: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.14.0.tar.xz" to "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.15.0.tar.xz"
packages/x86-64-v3-poky-linux/pciutils: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.14.0", added "/usr/lib/libpci.so.3.15.0"
packages/x86-64-v3-poky-linux/pciutils/libpci: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/libpci: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-dbg: FILELIST: removed "/usr/lib/.debug/libpci.so.3.14.0", added "/usr/lib/.debug/libpci.so.3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-dbg: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-dbg: PKGSIZE changed from 846736 to 882496 (+4%)
packages/x86-64-v3-poky-linux/pciutils/pciutils-dbg: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-dev: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 114830 to 127398 (+11%)
packages/x86-64-v3-poky-linux/pciutils/pciutils-dev: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-doc: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 42373 to 42661 (+1%)
packages/x86-64-v3-poky-linux/pciutils/pciutils-doc: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-ids: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-ids: PKGSIZE changed from 348602 to 361726 (+4%)
packages/x86-64-v3-poky-linux/pciutils/pciutils-ids: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-locale: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-locale: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-src: FILELIST: directory renamed /usr/src/debug/pciutils/3.14.0 -> /usr/src/debug/pciutils/3.15.0, directory renamed /usr/src/debug/pciutils/3.14.0/lib -> /usr/src/debug/pciutils/3.15.0/lib, directory renamed /usr/src/debug/pciutils/3.14.0/lmr -> /usr/src/debug/pciutils/3.15.0/lmr
packages/x86-64-v3-poky-linux/pciutils/pciutils-src: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 464891 to 483865 (+4%)
packages/x86-64-v3-poky-linux/pciutils/pciutils-src: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils-staticdev: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils-staticdev: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/x86-64-v3-poky-linux/pciutils/pciutils: PV changed from "3.14.0" to "3.15.0"
packages/x86-64-v3-poky-linux/pciutils/pciutils: PKGSIZE changed from 198885 to 215269 (+8%)
packages/x86-64-v3-poky-linux/pciutils/pciutils: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
Changes to packages/x86-64-v3-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.14.0 to libpci.so.3.15.0
  /usr/lib/libpci.so.3.14.0 moved to /usr/lib/libpci.so.3.15.0

--===============2244680009097159027==--

