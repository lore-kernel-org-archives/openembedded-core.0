Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE13EFCBA7
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28795.1773582114506140725
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cRFoYdb5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iLELjX6s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019cf1bb5bec-59c0036d-cf9f-4133-9a27-4f70a7286fa7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RtZ1Fo5KxDx1qSgvFkxO8/2tC/f+OubZqQMgVyGYDfs=;
	b=cRFoYdb5Wne9nHnOv297Bti85o0W0631Q4JD4MXSq1kJeP1cf3BGOZgzw83+V8Xx
	M92ApV5a5UkMKTeWli5i/Ty2e24iY94IIZgUiTrNspNeN9oZ/QBKtfRbTXl9rJoBkal
	rVQ2OdLm7WmtW3aAm9FCcP5kkJLj3xujnEmgvMO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RtZ1Fo5KxDx1qSgvFkxO8/2tC/f+OubZqQMgVyGYDfs=;
	b=iLELjX6s8Ub5g4ZaqklqVGBC8v6Q04exUdnPzNiOge4p8uwlEkJgmV9IYJBmzBT9
	dMZAXKv7TIN3HoBFiBV6tr4Roeg15tDM5pvj8Eq+UwADhC++rL+V4zGfNxZzq6e2Q2S
	aJ+pNNSi8GDvPfN/zOEVRPI88JDvcbvdI1MuVV9A=
Content-Type: multipart/mixed; boundary="===============7493930684296171580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.03.0 SUCCEEDED
Message-ID: <0101019cf1bb5bec-59c0036d-cf9f-4133-9a27-4f70a7286fa7-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233128

--===============7493930684296171580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.03.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.01.0-2026.03.0.patch
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
From 438f0f0ffae24211eea1172ab8ab5a734f317b94 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 06:01:23 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.01.0 -> 2026.03.0

---
 meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 -
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 -------------------
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 14a5ca9709..17cfc25692 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.01.0"
+PV = "2026.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d1658f299441e4169"
+SRC_URI[sha256sum] = "760f22ff34ca00539d29826cce07d83210e41ebb51266616c6969b855c099bc2"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 1459f48db2..eb327306d9 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,8 +2,6 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
-SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
-
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
deleted file mode 100644
index 2ff7cb82a6..0000000000
--- a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-barebox-tools: fix build failure with glibc 2.43
-
-glibc 2.43 introduces linux/openat2.h through the fcntl include chain
-(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
-__u64 type to be defined before inclusion.
-
-In barebox scripts/include/linux/types.h the header <fcntl.h> was
-included before the __u64 typedef, causing build failures such as:
-
-  linux/openat2.h:20:9: error: unknown type name '__u64'
-
-Move the inclusion of <fcntl.h> after the typedef definitions so that
-__u64 and related types are defined before linux/openat2.h is parsed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
----
-
- scripts/include/linux/types.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
-index 5b01333..33cea19 100644
---- a/scripts/include/linux/types.h
-+++ b/scripts/include/linux/types.h
-@@ -4,7 +4,6 @@
- #include <stdbool.h>
- #include <stddef.h>
- #include <stdint.h>
--#include <fcntl.h>
-
- typedef uint64_t __u64;
- typedef int64_t __s64;
-@@ -15,6 +14,8 @@ typedef int16_t __s16;
- typedef uint8_t __u8;
- typedef int8_t __s8;
-
-+#include <fcntl.h>
-+
- #ifndef __linux__
- typedef long long loff_t;
- #endif
-- 
2.47.1


--===============7493930684296171580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.01.0" to "2026.03.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.01.0.tar.bz2 file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch" to "https://barebox.org/download/barebox-2026.03.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.01.0 [default] to 2026.03.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.01.0" to "2026.03.0"

--===============7493930684296171580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.01.0-2026.03.0.patch"

RnJvbSA0MzhmMGYwZmZhZTI0MjExZWVhMTE3MmFiOGFiNWE3MzRmMzE3Yjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDY6MDE6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDEuMCAtPiAyMDI2LjAzLjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyAgIHwgIDQgKy0KIG1ldGEvcmVj
aXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LXRvb2xzLmJiICAgICB8ICAyIC0KIC4uLngtdG9vbHMt
Zml4LWdsaWJjLTIuNDMtb3BlbmF0Mi1idWlsZC5wYXRjaCB8IDQzIC0tLS0tLS0tLS0tLS0tLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvZmlsZXMvMDAwMS1iYXJl
Ym94LXRvb2xzLWZpeC1nbGliYy0yLjQzLW9wZW5hdDItYnVpbGQucGF0Y2gKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNp
cGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCAxNGE1Y2E5NzA5Li4xN2Nm
YzI1NjkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21t
b24uaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
QEAgLTMsNiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTky
IgogCi1QViA9ICIyMDI2LjAxLjAiCitQViA9ICIyMDI2LjAzLjAiCiBTUkNfVVJJID0gImh0dHBz
Oi8vYmFyZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjIxOTI4M2Q2N2M1ZDJmNzliZDIyOTE1YjhhNzE5MDY1MzEyMjNjYjAxZTZl
NWI4ZDE2NThmMjk5NDQxZTQxNjkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzYwZjIyZmYzNGNh
MDA1MzlkMjk4MjZjY2UwN2Q4MzIxMGU0MWViYjUxMjY2NjE2YzY5NjliODU1YzA5OWJjMiIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LXRvb2xzLmJiIGIvbWV0
YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHMuYmIKaW5kZXggMTQ1OWY0OGRiMi4u
ZWIzMjczMDZkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gt
dG9vbHMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHMuYmIK
QEAgLTIsOCArMiw2IEBAIFNVTU1BUlkgPSAiYmFyZWJveCBib290bG9hZGVyIHRvb2xzIgogCiBy
ZXF1aXJlIGJhcmVib3gtY29tbW9uLmluYwogCi1TUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1iYXJl
Ym94LXRvb2xzLWZpeC1nbGliYy0yLjQzLW9wZW5hdDItYnVpbGQucGF0Y2giCi0KIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogCiBERVBFTkRTID0gImJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2ZSBs
aWJ1c2IxIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2ZpbGVzLzAwMDEt
YmFyZWJveC10b29scy1maXgtZ2xpYmMtMi40My1vcGVuYXQyLWJ1aWxkLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2ZpbGVzLzAwMDEtYmFyZWJveC10b29scy1maXgtZ2xpYmMtMi40
My1vcGVuYXQyLWJ1aWxkLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyZmY3
Y2I4MmE2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9maWxlcy8w
MDAxLWJhcmVib3gtdG9vbHMtZml4LWdsaWJjLTIuNDMtb3BlbmF0Mi1idWlsZC5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDQzICswLDAgQEAKLWJhcmVib3gtdG9vbHM6IGZpeCBidWlsZCBmYWls
dXJlIHdpdGggZ2xpYmMgMi40MwotCi1nbGliYyAyLjQzIGludHJvZHVjZXMgbGludXgvb3BlbmF0
Mi5oIHRocm91Z2ggdGhlIGZjbnRsIGluY2x1ZGUgY2hhaW4KLShiaXRzL2ZjbnRsLWxpbnV4Lmgg
LT4gbGludXgvb3BlbmF0Mi5oKS4gVGhpcyBoZWFkZXIgZXhwZWN0cyB0aGUKLV9fdTY0IHR5cGUg
dG8gYmUgZGVmaW5lZCBiZWZvcmUgaW5jbHVzaW9uLgotCi1JbiBiYXJlYm94IHNjcmlwdHMvaW5j
bHVkZS9saW51eC90eXBlcy5oIHRoZSBoZWFkZXIgPGZjbnRsLmg+IHdhcwotaW5jbHVkZWQgYmVm
b3JlIHRoZSBfX3U2NCB0eXBlZGVmLCBjYXVzaW5nIGJ1aWxkIGZhaWx1cmVzIHN1Y2ggYXM6Ci0K
LSAgbGludXgvb3BlbmF0Mi5oOjIwOjk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnX191NjQn
Ci0KLU1vdmUgdGhlIGluY2x1c2lvbiBvZiA8ZmNudGwuaD4gYWZ0ZXIgdGhlIHR5cGVkZWYgZGVm
aW5pdGlvbnMgc28gdGhhdAotX191NjQgYW5kIHJlbGF0ZWQgdHlwZXMgYXJlIGRlZmluZWQgYmVm
b3JlIGxpbnV4L29wZW5hdDIuaCBpcyBwYXJzZWQuCi0KLVVwc3RyZWFtLVN0YXR1czogUGVuZGlu
ZwotCi1TaWduZWQtb2ZmLWJ5OiBIZW1hbnRoIEt1bWFyIE0gRCA8SGVtYW50aC5LdW1hck1EQHdp
bmRyaXZlci5jb20+Ci0tLS0KLQotIHNjcmlwdHMvaW5jbHVkZS9saW51eC90eXBlcy5oIHwgMyAr
Ky0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRp
ZmYgLS1naXQgYS9zY3JpcHRzL2luY2x1ZGUvbGludXgvdHlwZXMuaCBiL3NjcmlwdHMvaW5jbHVk
ZS9saW51eC90eXBlcy5oCi1pbmRleCA1YjAxMzMzLi4zM2NlYTE5IDEwMDY0NAotLS0tIGEvc2Ny
aXB0cy9pbmNsdWRlL2xpbnV4L3R5cGVzLmgKLSsrKyBiL3NjcmlwdHMvaW5jbHVkZS9saW51eC90
eXBlcy5oCi1AQCAtNCw3ICs0LDYgQEAKLSAjaW5jbHVkZSA8c3RkYm9vbC5oPgotICNpbmNsdWRl
IDxzdGRkZWYuaD4KLSAjaW5jbHVkZSA8c3RkaW50Lmg+Ci0tI2luY2x1ZGUgPGZjbnRsLmg+Ci0K
LSB0eXBlZGVmIHVpbnQ2NF90IF9fdTY0OwotIHR5cGVkZWYgaW50NjRfdCBfX3M2NDsKLUBAIC0x
NSw2ICsxNCw4IEBAIHR5cGVkZWYgaW50MTZfdCBfX3MxNjsKLSB0eXBlZGVmIHVpbnQ4X3QgX191
ODsKLSB0eXBlZGVmIGludDhfdCBfX3M4OwotCi0rI2luY2x1ZGUgPGZjbnRsLmg+Ci0rCi0gI2lm
bmRlZiBfX2xpbnV4X18KLSB0eXBlZGVmIGxvbmcgbG9uZyBsb2ZmX3Q7Ci0gI2VuZGlmCi0tIAoy
LjQ3LjEKCg==

--===============7493930684296171580==--

