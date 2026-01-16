Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D46D489B0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1433.1768526746824595424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZKLCD6OY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gg8BMn9O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc468bf53-2b82be96-03f3-4814-a391-8965f09cdc65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q4pKRWabTf80q4/HHv3w4hyCNBsoA+B9oXZG0Ayt31k=;
	b=ZKLCD6OYHbVQEXl8Xjkxdf+mnHyDOlkBi8NR9UeQjN12ZPK0bkj8AC3hE+p5m2tw
	QDpT0keEGGXWa/empDO0EK+iOtiMtYNehz4flkf6eW84Ff9KgMWvO4SEcO/HAU+YZuT
	/nvrn1XLzEE+/bPSFv3B/p6hr7K2k+BiX17nr/Xs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q4pKRWabTf80q4/HHv3w4hyCNBsoA+B9oXZG0Ayt31k=;
	b=gg8BMn9OI7Z3nObNWP7lDxUYGZgvYS1v9DlXpnR8/PYqv8DBrSw0bbu5CURnINiz
	qu7yAv/ZkGSdclkDTraXi4ZSm6UUiTF40uSVvhUEMve3lLphlsSMFr/VXbkZhNuPJbu
	gWpMXlarQVNi+n3gWapJCjhsM9KRb11NtoHVMrak=
Content-Type: multipart/mixed; boundary="===============4212819622983835789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libtasn1: upgrading to 4.21.0 SUCCEEDED
Message-ID: <0101019bc468bf53-2b82be96-03f3-4814-a391-8965f09cdc65-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229510

--===============4212819622983835789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtasn1* to *4.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtasn1-upgrade-4.20.0-4.21.0.patch
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
From 5ce64d96bbf54e04bdc10fe9daee9fb4c56f48aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 01:02:53 +0000
Subject: [PATCH] libtasn1: upgrade 4.20.0 -> 4.21.0

---
 .../gnutls/libtasn1/dont-depend-on-help2man.patch            | 5 ++---
 .../gnutls/{libtasn1_4.20.0.bb => libtasn1_4.21.0.bb}        | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.20.0.bb => libtasn1_4.21.0.bb} (89%)

diff --git a/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
index 216d636793..60f4f01b9c 100644
--- a/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
+++ b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
@@ -1,4 +1,4 @@
-From 629fc6427710e48b78f8b1f300dd698fe898cfd4 Mon Sep 17 00:00:00 2001
+From 0a8bf986a18d27357727cfe4bbaa3e9a9f0bbcf2 Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Mon, 7 Jan 2013 01:49:40 +0200
 Subject: [PATCH] libtasn1: remove help2man dependency
@@ -6,13 +6,12 @@ Subject: [PATCH] libtasn1: remove help2man dependency
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
 ---
  doc/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index a0171a5..8aa4d3d 100644
+index 691dcb7..0d0c26f 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
 @@ -28,7 +28,7 @@ libtasn1_TEXINFOS += asn1Coding-help.texi asn1Decoding-help.texi asn1Parser-help
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
similarity index 89%
rename from meta/recipes-support/gnutls/libtasn1_4.20.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.21.0.bb
index 8127ba5b1d..4570488c4c 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c"
+SRC_URI[sha256sum] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.47.1


--===============4212819622983835789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtasn1-upgrade-4.20.0-4.21.0.patch"

RnJvbSA1Y2U2NGQ5NmJiZjU0ZTA0YmRjMTBmZTlkYWVlOWZiNGM1NmY0OGFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDE6MDI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0YXNuMTogdXBncmFkZSA0LjIwLjAgLT4gNC4yMS4wCgotLS0KIC4uLi9nbnV0bHMvbGlidGFz
bjEvZG9udC1kZXBlbmQtb24taGVscDJtYW4ucGF0Y2ggICAgICAgICAgICB8IDUgKystLS0KIC4u
Li9nbnV0bHMve2xpYnRhc24xXzQuMjAuMC5iYiA9PiBsaWJ0YXNuMV80LjIxLjAuYmJ9ICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy97bGlidGFzbjFfNC4yMC4wLmJi
ID0+IGxpYnRhc24xXzQuMjEuMC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnV0bHMvbGlidGFzbjEvZG9udC1kZXBlbmQtb24taGVscDJtYW4ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvbGlidGFzbjEvZG9udC1kZXBlbmQtb24taGVscDJt
YW4ucGF0Y2gKaW5kZXggMjE2ZDYzNjc5My4uNjBmNGYwMWI5YyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251dGxzL2xpYnRhc24xL2RvbnQtZGVwZW5kLW9uLWhlbHAybWFuLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9saWJ0YXNuMS9kb250LWRlcGVu
ZC1vbi1oZWxwMm1hbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjI5ZmM2NDI3NzEwZTQ4
Yjc4ZjhiMWYzMDBkZDY5OGZlODk4Y2ZkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGE4YmY5ODZhMThkMjczNTc3MjdjZmU0YmJhYTNlOWE5ZjBiYmNmMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IE1hcmtvIExpbmRxdmlzdCA8Y2F6Zmk3NEBnbWFpbC5jb20+CiBEYXRl
OiBNb24sIDcgSmFuIDIwMTMgMDE6NDk6NDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGlidGFz
bjE6IHJlbW92ZSBoZWxwMm1hbiBkZXBlbmRlbmN5CkBAIC02LDEzICs2LDEyIEBAIFN1YmplY3Q6
IFtQQVRDSF0gbGlidGFzbjE6IHJlbW92ZSBoZWxwMm1hbiBkZXBlbmRlbmN5CiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUKIAogU2lnbmVkLW9mZi1ieTogTWFya28gTGluZHF2aXN0IDxj
YXpmaTc0QGdtYWlsLmNvbT4KLQogLS0tCiAgZG9jL01ha2VmaWxlLmFtIHwgMiArLQogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
ZG9jL01ha2VmaWxlLmFtIGIvZG9jL01ha2VmaWxlLmFtCi1pbmRleCBhMDE3MWE1Li44YWE0ZDNk
IDEwMDY0NAoraW5kZXggNjkxZGNiNy4uMGQwYzI2ZiAxMDA2NDQKIC0tLSBhL2RvYy9NYWtlZmls
ZS5hbQogKysrIGIvZG9jL01ha2VmaWxlLmFtCiBAQCAtMjgsNyArMjgsNyBAQCBsaWJ0YXNuMV9U
RVhJTkZPUyArPSBhc24xQ29kaW5nLWhlbHAudGV4aSBhc24xRGVjb2RpbmctaGVscC50ZXhpIGFz
bjFQYXJzZXItaGVscApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2xp
YnRhc24xXzQuMjAuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9saWJ0YXNuMV80
LjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251dGxzL2xpYnRhc24xXzQuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251dGxzL2xpYnRhc24xXzQuMjEuMC5iYgppbmRleCA4MTI3YmE1YjFkLi40NTcwNDg4
YzRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvbGlidGFzbjFfNC4y
MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9saWJ0YXNuMV80LjIxLjAu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2xpYnRhc24xL2xp
YnRhc24xLSR7UFZ9LnRhci5neiBcCiAKIERFUEVORFMgPSAiYmlzb24tbmF0aXZlIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOTJlMGUzYmQ0YzAyZDRhZWVlNzYwMzZiMmRkZDgzZjBjNzMyYmE0
Y2RhNWNiNzFkNTgzMjcyYjIzNTg3YTc2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDhhNDQ0
YTIyM2NjNTQ2NDI0MDc3NzM0NmUxMjVkZTUxZDhlNmFiZjBiOGJhYzc0MmFjODQ2MDkxNjdkYzg3
IgogCiBpbmhlcml0IGF1dG90b29scyB0ZXhpbmZvIGxpYl9wYWNrYWdlIGd0ay1kb2MKIAotLSAK
Mi40Ny4xCgo=

--===============4212819622983835789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtasn1/libtasn1-doc: PKGSIZE changed from 156289 to 71450 (-54%)
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-src: PKGSIZE changed from 857413 to 984929 (+15%)
packages/x86-64-v3-poky-linux/libtasn1/libtasn1: FILELIST: removed "/usr/lib/libtasn1.so.6.6.4", added "/usr/lib/libtasn1.so.6.6.5"
Changes to packages/x86-64-v3-poky-linux/libtasn1 (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so.6.6.4 moved to /usr/lib/libtasn1.so.6.6.5
Changes to packages/x86_64-linux/libtasn1-native (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so.6.6.4 moved to /usr/lib/libtasn1.so.6.6.5

--===============4212819622983835789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtasn1: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz file://dont-depend-on-help2man.patch" to "https://ftpmirror.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz file://dont-depend-on-help2man.patch"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-bin: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-bin: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dbg: FILELIST: removed "/usr/lib/.debug/libtasn1.so.6.6.4", added "/usr/lib/.debug/libtasn1.so.6.6.5"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dbg: PKGSIZE changed from 402288 to 401344 (-0%)
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dbg: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dbg: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dev: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-dev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-doc: PKGSIZE changed from 156289 to 71450 (-54%)
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-doc: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-doc: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-locale: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-locale: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-src: FILELIST: directory renamed /usr/src/debug/libtasn1/4.20.0/lib -> /usr/src/debug/libtasn1/4.21.0/lib, directory renamed /usr/src/debug/libtasn1/4.20.0/lib/includes -> /usr/src/debug/libtasn1/4.21.0/lib/includes, directory renamed /usr/src/debug/libtasn1/4.20.0/src -> /usr/src/debug/libtasn1/4.21.0/src, removed "/usr/src/debug/libtasn1/4.20.0/src/gl/progname.h /usr/src/debug/libtasn1/4.20.0/src/gl/memset_explicit.c /usr/src/debug/libtasn1/4.20.0/src/gl/getopt1.c /usr/src/debug/libtasn1/4.20.0/src/gl/progname.c /usr/src/debug/libtasn1/4.20.0/lib/gl/c-ctype.h /usr/src/debug/libtasn1/4.20.0/src/gl/getopt-core.h /usr/src/debug/libtasn1/4.20.0/src/gl/getopt.c /usr/src/debug/libtasn1/4.20.0/src/gl/stdio.h /usr/src/debug/libtasn1/4.20.0/src/gl/timespec.h /usr/src/debug/libtasn1/4.20.0/src/gl/stdlib.h /usr/src/debug/libtasn1/4.20.0/lib/gl/string.h /usr/src/debug/libtasn1/4.20.0/src/gl/version-etc.h /usr/src/debug/libtasn1/4.20.0/src/gl/gett
 ime.c /usr/src/debug/libtasn1/4.20.0/src/gl/read-file.c /usr/src/debug/libtasn1/4.20.0/src/gl/version-etc.c /usr/src/debug/libtasn1/4.20.0/src/gl/read-file.h /usr/src/debug/libtasn1/4.20.0/src/gl/version-etc-fsf.c /usr/src/debug/libtasn1/4.20.0/src/gl/getopt-ext.h /usr/src/debug/libtasn1/4.20.0/src/gl/fopen.c /usr/src/debug/libtasn1/4.20.0/src/gl/getopt_int.h /usr/src/debug/libtasn1/4.20.0/src/gl/string.h", added "/usr/src/debug/libtasn1/4.21.0/lib/gl/stdlib.h /usr/src/debug/libtasn1/4.21.0/src/gl/progname.h /usr/src/debug/libtasn1/4.21.0/src/gl/memset_explicit.c /usr/src/debug/libtasn1/4.21.0/src/gl/getopt1.c /usr/src/debug/libtasn1/4.21.0/src/gl/progname.c /usr/src/debug/libtasn1/4.21.0/lib/gl/c-ctype.h /usr/src/debug/libtasn1/4.21.0/src/gl/getopt-core.h /usr/src/debug/libtasn1/4.21.0/src/gl/getopt.c /usr/src/debug/libtasn1/4.21.0/src/gl/stdio.h /usr/src/debug/libtasn1/4.21.0/src/gl/timespec.h /usr/src/debug/libtasn1/4.21.0/src/gl/stdlib.h /usr/src/debug/libtasn1/4.21.0/lib/gl/str
 ing.h /usr/src/debug/libtasn1/4.21.0/src/gl/version-etc.h /usr/src/debug/libtasn1/4.21.0/src/gl/gettime.c /usr/src/debug/libtasn1/4.21.0/src/gl/read-file.c /usr/src/debug/libtasn1/4.21.0/src/gl/version-etc.c /usr/src/debug/libtasn1/4.21.0/src/gl/read-file.h /usr/src/debug/libtasn1/4.21.0/src/gl/version-etc-fsf.c /usr/src/debug/libtasn1/4.21.0/src/gl/getopt-ext.h /usr/src/debug/libtasn1/4.21.0/src/gl/fopen.c /usr/src/debug/libtasn1/4.21.0/src/gl/getopt_int.h /usr/src/debug/libtasn1/4.21.0/src/gl/string.h /usr/src/debug/libtasn1/4.21.0/src/gl/gettext.h"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-src: PKGSIZE changed from 857413 to 984929 (+15%)
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-src: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-src: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-staticdev: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1-staticdev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/x86-64-v3-poky-linux/libtasn1/libtasn1: FILELIST: removed "/usr/lib/libtasn1.so.6.6.4", added "/usr/lib/libtasn1.so.6.6.5"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1: PV changed from "4.20.0" to "4.21.0"
packages/x86-64-v3-poky-linux/libtasn1/libtasn1: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
Changes to packages/x86-64-v3-poky-linux/libtasn1 (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so.6.6.4 moved to /usr/lib/libtasn1.so.6.6.5
Changes to packages/x86_64-linux/libtasn1-native (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.4 to libtasn1.so.6.6.5
  /usr/lib/libtasn1.so.6.6.4 moved to /usr/lib/libtasn1.so.6.6.5

--===============4212819622983835789==--

