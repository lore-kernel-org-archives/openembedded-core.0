Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EADCD484A
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15711.1777645533486712560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bj8Ou99y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mpIyP7DW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee901e-536b9101-3a73-4df4-8db9-98d740c6db8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3OdXBncj36gugVfMaeO4y/2MyB839Kw348rLxhaaulw=;
	b=bj8Ou99yysHIBXQCiZEAEUR2T+a1jBkw6r1SSZF9XQi7ImXvVrseHOLzjc9fP7BA
	ocZ0fcT+ra4o5ElMMCXG7jgk+IgXCqm4Tbhtm1YcgDAlXQ0tPOorh4GvtL0qFPHdwOk
	96Ii8sXl0B2g4/T7zi96jZT1giTy9Mb9K135T44k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3OdXBncj36gugVfMaeO4y/2MyB839Kw348rLxhaaulw=;
	b=mpIyP7DWuT3bze6ENwToFuOVgKGXoUQmmsoZRl3QjhhfxzX7LXcIkWoniEf93W8g
	chzan0QHqf0mTHD5TfmMtZ12xwQE4rSSnMI7nm+eiaUZnuAS6oEeWzgVbvk8sfW1OAc
	bQMVnlh8uSYdHjCJgpYFXx9kWNeWXtJnDgNk+2vs=
Content-Type: multipart/mixed; boundary="===============2297187889680700800=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmpc: upgrading to 1.4.1 SUCCEEDED
Message-ID: <0101019de3ee901e-536b9101-3a73-4df4-8db9-98d740c6db8f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236295

--===============2297187889680700800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmpc* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmpc-upgrade-1.4.0-1.4.1.patch
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
From 5c0b36c41e8ad17da8b44f1923c7739a6cd9b5e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 14:15:29 +0000
Subject: [PATCH] libmpc: upgrade 1.4.0 -> 1.4.1

---
 .../recipes-support/libmpc/{libmpc_1.4.0.bb => libmpc_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmpc/{libmpc_1.4.0.bb => libmpc_1.4.1.bb} (72%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.4.0.bb b/meta/recipes-support/libmpc/libmpc_1.4.1.bb
similarity index 72%
rename from meta/recipes-support/libmpc/libmpc_1.4.0.bb
rename to meta/recipes-support/libmpc/libmpc_1.4.1.bb
index 78ce0bfe88..fca6bc2cc7 100644
--- a/meta/recipes-support/libmpc/libmpc_1.4.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.4.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3210b3a546b1cb00c296ca360891d7740ee6ff06deb02a27a35b20cd3c0bb1a5"
+SRC_URI[sha256sum] = "91204cd32f164bd3b7c992d4a6a8ce6519511aadab30f78b6982d0bf8d73e931"
 
 S = "${UNPACKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============2297187889680700800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmpc/libmpc: FILELIST: removed "/usr/lib/libmpc.so.3.4.0", added "/usr/lib/libmpc.so.3.4.1"
Changes to packages/x86-64-v3-poky-linux/libmpc (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so.3.4.0 moved to /usr/lib/libmpc.so.3.4.1
Changes to packages/x86_64-linux/libmpc-native (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so.3.4.0 moved to /usr/lib/libmpc.so.3.4.1

--===============2297187889680700800==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmpc-upgrade-1.4.0-1.4.1.patch"

RnJvbSA1YzBiMzZjNDFlOGFkMTdkYThiNDRmMTkyM2M3NzM5YTZjZDliNWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxNDoxNToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1wYzogdXBncmFkZSAxLjQuMCAtPiAxLjQuMQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2xp
Ym1wYy97bGlibXBjXzEuNC4wLmJiID0+IGxpYm1wY18xLjQuMS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJtcGMve2xpYm1wY18xLjQuMC5iYiA9PiBsaWJtcGNfMS40LjEuYmJ9ICg3
MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibXBjL2xpYm1wY18xLjQu
MC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1wYy9saWJtcGNfMS40LjEuYmIKc2ltaWxh
cml0eSBpbmRleCA3MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibXBjL2xp
Ym1wY18xLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibXBjL2xpYm1w
Y18xLjQuMS5iYgppbmRleCA3OGNlMGJmZTg4Li5mY2E2YmMyY2M3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJtcGMvbGlibXBjXzEuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYm1wYy9saWJtcGNfMS40LjEuYmIKQEAgLTUsNyArNSw3IEBAIERFUEVORFMg
PSAiZ21wIG1wZnIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkxFU1NFUjtt
ZDU9ZTZhNjAwZmQ1ZTFkOWNiZGUyZDk4MzY4MDIzM2FkMDIiCiBTUkNfVVJJID0gIiR7R05VX01J
UlJPUn0vbXBjL21wYy0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjEw
YjNhNTQ2YjFjYjAwYzI5NmNhMzYwODkxZDc3NDBlZTZmZjA2ZGViMDJhMjdhMzViMjBjZDNjMGJi
MWE1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxMjA0Y2QzMmYxNjRiZDNiN2M5OTJkNGE2YThj
ZTY1MTk1MTFhYWRhYjMwZjc4YjY5ODJkMGJmOGQ3M2U5MzEiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9
L21wYy0ke1BWfSIKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcu
MQoK

--===============2297187889680700800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/libmpc: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/mpc/mpc-1.4.0.tar.xz" to "https://ftpmirror.gnu.org/gnu/mpc/mpc-1.4.1.tar.xz"
packages/x86-64-v3-poky-linux/libmpc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-dbg: PKGSIZE changed from 460192 to 460128 (-0%)
packages/x86-64-v3-poky-linux/libmpc/libmpc-dbg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-dbg: FILELIST: removed "/usr/lib/.debug/libmpc.so.3.4.0", added "/usr/lib/.debug/libmpc.so.3.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-dbg: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-dev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-dev: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-doc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-doc: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-locale: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-locale: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-src: PKGSIZE changed from 414303 to 414299 (-0%)
packages/x86-64-v3-poky-linux/libmpc/libmpc-src: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-src: FILELIST: directory renamed /usr/src/debug/libmpc/1.4.0/src -> /usr/src/debug/libmpc/1.4.1/src
packages/x86-64-v3-poky-linux/libmpc/libmpc-src: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc-staticdev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc-staticdev: PV changed from "1.4.0" to "1.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/libmpc/libmpc: FILELIST: removed "/usr/lib/libmpc.so.3.4.0", added "/usr/lib/libmpc.so.3.4.1"
packages/x86-64-v3-poky-linux/libmpc/libmpc: PV changed from "1.4.0" to "1.4.1"
Changes to packages/x86-64-v3-poky-linux/libmpc (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so.3.4.0 moved to /usr/lib/libmpc.so.3.4.1
Changes to packages/x86_64-linux/libmpc-native (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.4.0 to libmpc.so.3.4.1
  /usr/lib/libmpc.so.3.4.0 moved to /usr/lib/libmpc.so.3.4.1

--===============2297187889680700800==--

