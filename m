Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AD0C5AE4A
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.14625.1700059030184937340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I5bbzTa0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mqWIyiRt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a2f3e-11244f25-04c6-49b6-abcd-96f536505546-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HVeooMCJTKvNLxdDSox39skK1JPkgGpc3UxY8qquQMU=;
	b=I5bbzTa0Sn9lYzBAXjKES/LrS5OhZxq1yXBvGHMeBJe2m4IPxhZEvqsrhI2+Lc2H
	44dRw2Wv1IifRo3m3pdYi2fisOcVXkzoz8OagDHkbboPhoNgHQl2hF/hBJQ+IAxB2CF
	ZgFFYqggI6PznWTbhpNIexUVcAsGHlGKwC/9LrZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HVeooMCJTKvNLxdDSox39skK1JPkgGpc3UxY8qquQMU=;
	b=mqWIyiRtKQzNSnJbv31PJHrJmZqqB7x5BoJMwmYuraRz2IxfHssLuTHVaNLgSuis
	zoSwjlMT52G0onESUoA4W2TE1woFKe+aPkiafRzv0GGlfwbYkeQKiVMuuFe2AZChDhV
	mlcrk+HXlJQRGZmdEmrN4EIdoKSebrPpMnUjE1EE=
Content-Type: multipart/mixed; boundary="===============5591494373524749571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.10.3 SUCCEEDED
Message-ID: <0101018bd36a2f3e-11244f25-04c6-49b6-abcd-96f536505546-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190725

--===============5591494373524749571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgcrypt* to *1.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.10.2-1.10.3.patch
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
From 6ff52859a1b0c75de883b5eb1606b3840eef8818 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 14:09:17 +0000
Subject: [PATCH] libgcrypt: upgrade 1.10.2 -> 1.10.3

---
 .../libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 524b06ca22..1c4f4d6038 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"
+SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
 CVE_STATUS[CVE-2018-12433] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
 CVE_STATUS[CVE-2018-12438] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
-- 
2.39.2


--===============5591494373524749571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libgcrypt: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.2.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.3.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.4.2", added "/usr/lib/.debug/libgcrypt.so.20.4.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 5495280 to 5513312 (+0%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PKGSIZE changed from 351184 to 351978 (+0%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: FILELIST: directory renamed /usr/src/debug/libgcrypt/1.10.2-r0/random -> /usr/src/debug/libgcrypt/1.10.3-r0/random, directory renamed /usr/src/debug/libgcrypt/1.10.2-r0/tests -> /usr/src/debug/libgcrypt/1.10.3-r0/tests, directory renamed /usr/src/debug/libgcrypt/1.10.2-r0/cipher -> /usr/src/debug/libgcrypt/1.10.3-r0/cipher, directory renamed /usr/src/debug/libgcrypt/1.10.2-r0/mpi -> /usr/src/debug/libgcrypt/1.10.3-r0/mpi, directory renamed /usr/src/debug/libgcrypt/1.10.2-r0/compat -> /usr/src/debug/libgcrypt/1.10.3-r0/compat, removed "/usr/src/debug/libgcrypt/1.10.2-r0/src/dumpsexp.c /usr/src/debug/libgcrypt/1.10.2-r0/src/types.h /usr/src/debug/libgcrypt/1.10.2-r0/src/fips.c /usr/src/debug/libgcrypt/1.10.2-r0/src/global.c /usr/src/debug/libgcrypt/1.10.2-r0/src/mpi.h /usr/src/debug/libgcrypt/1.10.2-r0/src/hmac256.h /usr/src/debug/libgcrypt/1.10.2-r0/src/stdmem.c /usr/src/debug/libgcrypt/1.10.2-r0/src/hmac256.c /usr/src/debug/libgcr
 ypt/1.10.2-r0/src/ec-context.h /usr/src/debug/libgcrypt/1.10.2-r0/src/gcrypt-int.h /usr/src/debug/libgcrypt/1.10.2-r0/src/stdmem.h /usr/src/debug/libgcrypt/1.10.2-r0/src/context.h /usr/src/debug/libgcrypt/1.10.2-r0/src/sexp.c /usr/src/debug/libgcrypt/1.10.2-r0/src/context.c /usr/src/debug/libgcrypt/1.10.2-r0/src/cipher.h /usr/src/debug/libgcrypt/1.10.2-r0/src/hwfeatures.c /usr/src/debug/libgcrypt/1.10.2-r0/src/misc.c /usr/src/debug/libgcrypt/1.10.2-r0/src/mpicalc.c /usr/src/debug/libgcrypt/1.10.2-r0/src/secmem.c /usr/src/debug/libgcrypt/1.10.2-r0/src/g10lib.h /usr/src/debug/libgcrypt/1.10.2-r0/src/secmem.h /usr/src/debug/libgcrypt/1.10.2-r0/src/visibility.c /usr/src/debug/libgcrypt/1.10.2-r0/src/cipher-proto.h /usr/src/debug/libgcrypt/1.10.2-r0/src/gcrypt.h /usr/src/debug/libgcrypt/1.10.2-r0/src/gcrypt-testapi.h", added "/usr/src/debug/libgcrypt/1.10.3-r0/src/dumpsexp.c /usr/src/debug/libgcrypt/1.10.3-r0/src/types.h /usr/src/debug/libgcrypt/1.10.3-r0/src/fips.c /usr/src/debug/libgcr
 ypt/1.10.3-r0/src/global.c /usr/src/debug/libgcrypt/1.10.3-r0/src/mpi.h /usr/src/debug/libgcrypt/1.10.3-r0/src/hmac256.h /usr/src/debug/libgcrypt/1.10.3-r0/src/const-time.c /usr/src/debug/libgcrypt/1.10.3-r0/src/stdmem.c /usr/src/debug/libgcrypt/1.10.3-r0/src/hmac256.c /usr/src/debug/libgcrypt/1.10.3-r0/src/ec-context.h /usr/src/debug/libgcrypt/1.10.3-r0/src/const-time.h /usr/src/debug/libgcrypt/1.10.3-r0/src/gcrypt-int.h /usr/src/debug/libgcrypt/1.10.3-r0/src/stdmem.h /usr/src/debug/libgcrypt/1.10.3-r0/src/context.h /usr/src/debug/libgcrypt/1.10.3-r0/src/sexp.c /usr/src/debug/libgcrypt/1.10.3-r0/src/context.c /usr/src/debug/libgcrypt/1.10.3-r0/src/cipher.h /usr/src/debug/libgcrypt/1.10.3-r0/src/hwfeatures.c /usr/src/debug/libgcrypt/1.10.3-r0/src/misc.c /usr/src/debug/libgcrypt/1.10.3-r0/src/mpicalc.c /usr/src/debug/libgcrypt/1.10.3-r0/src/secmem.c /usr/src/debug/libgcrypt/1.10.3-r0/src/g10lib.h /usr/src/debug/libgcrypt/1.10.3-r0/src/secmem.h /usr/src/debug/libgcrypt/1.10.3-r0/src/v
 isibility.c /usr/src/debug/libgcrypt/1.10.3-r0/src/cipher-proto.h /usr/src/debug/libgcrypt/1.10.3-r0/src/gcrypt.h /usr/src/debug/libgcrypt/1.10.3-r0/src/gcrypt-testapi.h"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 5097236 to 5108578 (+0%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.4.2", added "/usr/lib/libgcrypt.so.20.4.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PV changed from "1.10.2" to "1.10.3"
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PKGSIZE changed from 941819 to 937691 (-0%)
Changes to packages/core2-64-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so.20.4.2 moved to /usr/lib/libgcrypt.so.20.4.3
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so.20.4.2 moved to /usr/lib/libgcrypt.so.20.4.3

--===============5591494373524749571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.4.2", added "/usr/lib/libgcrypt.so.20.4.3"
Changes to packages/core2-64-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so.20.4.2 moved to /usr/lib/libgcrypt.so.20.4.3
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.4.2 to libgcrypt.so.20.4.3
  /usr/lib/libgcrypt.so.20.4.2 moved to /usr/lib/libgcrypt.so.20.4.3

--===============5591494373524749571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.10.2-1.10.3.patch"

RnJvbSA2ZmY1Mjg1OWExYjBjNzVkZTg4M2I1ZWIxNjA2YjM4NDBlZWY4ODE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTQ6MDk6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnY3J5cHQ6IHVwZ3JhZGUgMS4xMC4yIC0+IDEuMTAuMwoKLS0tCiAuLi4vbGliZ2NyeXB0L3ts
aWJnY3J5cHRfMS4xMC4yLmJiID0+IGxpYmdjcnlwdF8xLjEwLjMuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQve2xpYmdjcnlwdF8xLjEwLjIuYmIgPT4gbGliZ2Ny
eXB0XzEuMTAuMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnY3J5cHQvbGliZ2NyeXB0XzEuMTAuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdj
cnlwdC9saWJnY3J5cHRfMS4xMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMC4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTAuMy5iYgpp
bmRleCA1MjRiMDZjYTIyLi4xYzRmNGQ2MDM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTAuMy5iYgpAQCAtMjcsNyArMjcsNyBAQCBTUkNf
VVJJID0gIiR7R05VUEdfTUlSUk9SfS9saWJnY3J5cHQvbGliZ2NyeXB0LSR7UFZ9LnRhci5iejIg
XAogICAgICAgICAgICBmaWxlOi8vbm8tYmVuY2gtc2xvcGUucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNi
OWMwMmEwMDRiNjhjMjU2YWRkOTk3MDFkZTAwYjM4M2FjY2NjZjM3MTc3ZTBkNmM1ODI4OTY2NGNj
ZTBjMDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGIwODcwODk3YWM1YWM2N2RlZDU2OGRjZmFk
ZjQ1OTY5Y2ZhOGE2YmViMGZkNjBhZjJhOWVhZGMyYTMyNzJhYSIKIAogQ1ZFX1NUQVRVU1tDVkUt
MjAxOC0xMjQzM10gPSAiZGlzcHV0ZWQ6IENWRSBpcyBkaXNwdXRlZCBhbmQgbm90IGFmZmVjdGlu
ZyBjcnlwdG8gbGlicmFyaWVzIGZvciBhbnkgZGlzdHJvLiIKIENWRV9TVEFUVVNbQ1ZFLTIwMTgt
MTI0MzhdID0gImRpc3B1dGVkOiBDVkUgaXMgZGlzcHV0ZWQgYW5kIG5vdCBhZmZlY3RpbmcgY3J5
cHRvIGxpYnJhcmllcyBmb3IgYW55IGRpc3Ryby4iCi0tIAoyLjM5LjIKCg==

--===============5591494373524749571==--

