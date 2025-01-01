Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4835E77197
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11329.1735723934603909309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OHLc4aPs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H+61TRQN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019421355e87-c042e43d-3007-4202-89e1-67c45ca3044e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723933;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a7mOwe2i3y5yWWRveUxqez8FNTR89kusLcxkTmkt14o=;
	b=OHLc4aPsHaynGnXHjJnGGUpxzrDMd7hCol3RHbsnpDnuvZV44gLUAY09bEWB4zdG
	cRswFo20tBzbtNE2NkUo/EF+QxQGjmqaveaqQ27vS8or1nSOukqyfpzbL89UoadZmaQ
	y4vCtWYKWTtHzopoMUruOAou6G7YN8c4sN5bfEZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723933;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a7mOwe2i3y5yWWRveUxqez8FNTR89kusLcxkTmkt14o=;
	b=H+61TRQNXOlAlOryOvE9BtUBl8dTmb6VR7f+xy/IpXj47iokn2oeZC4INCmm/5Gm
	vHYOrRFExO58OyoVNl6E746yb0A1H/9LfsrdqnJGhoWjcCK4wlKpRxzZxjn1iHHHdze
	neZxlQ/5dlvttXGEjPF0+UDZ2cEPmOiNIp0NoaH4=
Content-Type: multipart/mixed; boundary="===============7354013190243993539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat,libxcrypt: upgrading to 4.4.37,4.4.37 FAILED
Message-ID: <0101019421355e87-c042e43d-3007-4202-89e1-67c45ca3044e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209192

--===============7354013190243993539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcrypt-compat,libxcrypt* to *4.4.37,4.4.37* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-libxcrypt-upgrade-4.4.36-4.4.37-4.4.patch
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
From c9cf6a57ef110d1d5ca67aaf64d678e0128241c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 05:11:39 +0000
Subject: [PATCH] libxcrypt-compat,libxcrypt: upgrade 4.4.36 -> 4.4.37,4.4.36
 -> 4.4.37

---
 .../libxcrypt/files/configure-c99.patch       | 39 -------------------
 .../libxcrypt/files/fix_cflags_handling.patch |  3 +-
 ...t_4.4.36.bb => libxcrypt-compat_4.4.37.bb} |  1 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  9 ++---
 ...ibxcrypt_4.4.36.bb => libxcrypt_4.4.37.bb} |  0
 5 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/files/configure-c99.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.36.bb => libxcrypt-compat_4.4.37.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.36.bb => libxcrypt_4.4.37.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/configure-c99.patch b/meta/recipes-core/libxcrypt/files/configure-c99.patch
deleted file mode 100644
index b77ea7af07..0000000000
--- a/meta/recipes-core/libxcrypt/files/configure-c99.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From cfe9f4d6b0a5d10a15e10e987d528c5c513a42f1 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Tue, 19 Dec 2023 11:00:11 +0100
-Subject: [PATCH] configure: Only text the makecontext signature we need
-
-The test/explicit-bzero.c test uses a start routine without any
-arguments.  There is no need for the multi-argument version.
-
-This avoids a build failure with glibc and future compilers.
-The GNU C library declares the makecontext callback of
-type void (*) (void), so no cast is needed.  On other systems,
-the type may be the (currently distinct) type void (*) (),
-but given that this only affects the ability to execute a test,
-no further machinery is added here to detect that different type.
-
-Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/178/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 016997c..4b8afd8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -303,13 +303,11 @@ AS_IF([test $ac_cv_header_ucontext_h = yes],
- #include <ucontext.h>
- static int x;
- static void fn1(void) {}
--static void fn2(int a, int b) { x = a - b; }
- ]], [[
-   ucontext_t uc1, uc2;
-   if (getcontext(&uc1)) return 1;
-   if (setcontext(&uc1)) return 1;
-   makecontext(&uc1, fn1, 0);
--  makecontext(&uc2, fn2, 2, 1, 1);
-   if (swapcontext(&uc1, &uc2)) return 1;
-   return x;
- ]])],
diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 94aa3fed49..9bb03fcd24 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 7b2a0cdc281d94a5782c37ef87040c341447b4b4 Mon Sep 17 00:00:00 2001
+From 1d91d150dd593e0c744c13b4ec8ec7cbf5da0f52 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
@@ -13,7 +13,6 @@ Avoid this by stripping empty elements out of CFLAGS.
 
 Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  build-aux/scripts/compute-symver-floor | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
index 30ec6a4674..bb4e2032dd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
@@ -16,3 +16,4 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ee6875aa05..9ecb333fb9 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,13 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://fix_cflags_handling.patch \
+           "
+SRCREV = "e5714d1f0a477f91ce3986fa63651c7710f0e183"
 SRCBRANCH ?= "master"
 
-SRC_URI += "file://fix_cflags_handling.patch \
-            file://configure-c99.patch"
-
 PROVIDES = "virtual/crypt"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
-- 
2.44.1


--===============7354013190243993539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcrypt-compat: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch file://configure-c99.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 573256 to 573280 (+0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 753271 to 753264 (-0%)
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch file://configure-c99.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGSIZE changed from 565336 to 565368 (+0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dbg: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-dev: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PKGSIZE changed from 32452 to 33329 (+3%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-doc: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-locale: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGSIZE changed from 746586 to 746579 (-0%)
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-src: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt-staticdev: PKGV changed from 4.4.36 [default] to 4.4.37 [default]
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PV changed from "4.4.36" to "4.4.37"
packages/core2-64-poky-linux/libxcrypt/libxcrypt: PKGV changed from 4.4.36 [default] to 4.4.37 [default]

--===============7354013190243993539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-libxcrypt-upgrade-4.4.36-4.4.37-4.4.patch"

RnJvbSBjOWNmNmE1N2VmMTEwZDFkNWNhNjdhYWY2NGQ2NzhlMDEyODI0MWM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNToxMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhjcnlwdC1jb21wYXQsbGlieGNyeXB0OiB1cGdyYWRlIDQuNC4zNiAtPiA0LjQuMzcsNC40LjM2
CiAtPiA0LjQuMzcKCi0tLQogLi4uL2xpYnhjcnlwdC9maWxlcy9jb25maWd1cmUtYzk5LnBhdGNo
ICAgICAgIHwgMzkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2xpYnhjcnlwdC9maWxlcy9maXhf
Y2ZsYWdzX2hhbmRsaW5nLnBhdGNoIHwgIDMgKy0KIC4uLnRfNC40LjM2LmJiID0+IGxpYnhjcnlw
dC1jb21wYXRfNC40LjM3LmJifSB8ICAxICsKIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9s
aWJ4Y3J5cHQuaW5jICAgICB8ICA5ICsrLS0tCiAuLi5pYnhjcnlwdF80LjQuMzYuYmIgPT4gbGli
eGNyeXB0XzQuNC4zNy5iYn0gfCAgMAogNSBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2xp
YnhjcnlwdC9maWxlcy9jb25maWd1cmUtYzk5LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvbGlieGNyeXB0L3tsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zNi5iYiA9PiBsaWJ4Y3J5cHQtY29t
cGF0XzQuNC4zNy5iYn0gKDk5JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQv
e2xpYnhjcnlwdF80LjQuMzYuYmIgPT4gbGlieGNyeXB0XzQuNC4zNy5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2ZpbGVzL2NvbmZpZ3VyZS1jOTku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvZmlsZXMvY29uZmlndXJlLWM5OS5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjc3ZWE3YWYwNy4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvZmlsZXMvY29uZmlndXJlLWM5OS5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM5ICswLDAgQEAKLUZyb20gY2ZlOWY0ZDZiMGE1ZDEw
YTE1ZTEwZTk4N2Q1MjhjNWM1MTNhNDJmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEZsb3JpYW4gV2VpbWVyIDxmd2VpbWVyQHJlZGhhdC5jb20+Ci1EYXRlOiBUdWUsIDE5IERlYyAy
MDIzIDExOjAwOjExICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogT25seSB0ZXh0
IHRoZSBtYWtlY29udGV4dCBzaWduYXR1cmUgd2UgbmVlZAotCi1UaGUgdGVzdC9leHBsaWNpdC1i
emVyby5jIHRlc3QgdXNlcyBhIHN0YXJ0IHJvdXRpbmUgd2l0aG91dCBhbnkKLWFyZ3VtZW50cy4g
IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBtdWx0aS1hcmd1bWVudCB2ZXJzaW9uLgotCi1UaGlz
IGF2b2lkcyBhIGJ1aWxkIGZhaWx1cmUgd2l0aCBnbGliYyBhbmQgZnV0dXJlIGNvbXBpbGVycy4K
LVRoZSBHTlUgQyBsaWJyYXJ5IGRlY2xhcmVzIHRoZSBtYWtlY29udGV4dCBjYWxsYmFjayBvZgot
dHlwZSB2b2lkICgqKSAodm9pZCksIHNvIG5vIGNhc3QgaXMgbmVlZGVkLiAgT24gb3RoZXIgc3lz
dGVtcywKLXRoZSB0eXBlIG1heSBiZSB0aGUgKGN1cnJlbnRseSBkaXN0aW5jdCkgdHlwZSB2b2lk
ICgqKSAoKSwKLWJ1dCBnaXZlbiB0aGF0IHRoaXMgb25seSBhZmZlY3RzIHRoZSBhYmlsaXR5IHRv
IGV4ZWN1dGUgYSB0ZXN0LAotbm8gZnVydGhlciBtYWNoaW5lcnkgaXMgYWRkZWQgaGVyZSB0byBk
ZXRlY3QgdGhhdCBkaWZmZXJlbnQgdHlwZS4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vZ2l0aHViLmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQvcHVsbC8xNzgvXQotU2lnbmVk
LW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBjb25maWd1
cmUuYWMgfCAyIC0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDAxNjk5N2MuLjRiOGFmZDgg
MTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTMwMywx
MyArMzAzLDExIEBAIEFTX0lGKFt0ZXN0ICRhY19jdl9oZWFkZXJfdWNvbnRleHRfaCA9IHllc10s
Ci0gI2luY2x1ZGUgPHVjb250ZXh0Lmg+Ci0gc3RhdGljIGludCB4OwotIHN0YXRpYyB2b2lkIGZu
MSh2b2lkKSB7fQotLXN0YXRpYyB2b2lkIGZuMihpbnQgYSwgaW50IGIpIHsgeCA9IGEgLSBiOyB9
Ci0gXV0sIFtbCi0gICB1Y29udGV4dF90IHVjMSwgdWMyOwotICAgaWYgKGdldGNvbnRleHQoJnVj
MSkpIHJldHVybiAxOwotICAgaWYgKHNldGNvbnRleHQoJnVjMSkpIHJldHVybiAxOwotICAgbWFr
ZWNvbnRleHQoJnVjMSwgZm4xLCAwKTsKLS0gIG1ha2Vjb250ZXh0KCZ1YzIsIGZuMiwgMiwgMSwg
MSk7Ci0gICBpZiAoc3dhcGNvbnRleHQoJnVjMSwgJnVjMikpIHJldHVybiAxOwotICAgcmV0dXJu
IHg7Ci0gXV0pXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9maWxl
cy9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0
L2ZpbGVzL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2gKaW5kZXggOTRhYTNmZWQ0OS4uOWJiMDNm
Y2QyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2ZpbGVzL2ZpeF9j
ZmxhZ3NfaGFuZGxpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2Zp
bGVzL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdiMmEw
Y2RjMjgxZDk0YTU3ODJjMzdlZjg3MDQwYzM0MTQ0N2I0YjQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDFkOTFkMTUwZGQ1OTNlMGM3NDRjMTNiNGVjOGVjN2NiZjVkYTBmNTIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMzAgQXByIDIwMjEgMTA6MzU6MDIgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGlieGNyeXB0OiBVcGRhdGUgdG8gNC40LjE5IHJlbGVhc2Ug
YW5kIGZpeCBzeW1ib2wgdmVyc2lvbgpAQCAtMTMsNyArMTMsNiBAQCBBdm9pZCB0aGlzIGJ5IHN0
cmlwcGluZyBlbXB0eSBlbGVtZW50cyBvdXQgb2YgQ0ZMQUdTLgogCiBVcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL2Jlc3NlcjgyL2xpYnhjcnlwdC9wdWxsLzEy
Nl0KIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPgotCiAtLS0KICBidWlsZC1hdXgvc2NyaXB0cy9jb21wdXRlLXN5bXZlci1m
bG9vciB8IDIgKysKICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzYuYmIg
Yi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzcuYmIK
c2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNy
eXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjM2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzcuYmIKaW5kZXggMzBlYzZhNDY3NC4u
YmI0ZTIwMzJkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhj
cnlwdC1jb21wYXRfNC40LjM2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9s
aWJ4Y3J5cHQtY29tcGF0XzQuNC4zNy5iYgpAQCAtMTYsMyArMTYsNCBAQCBkb19pbnN0YWxsOmFw
cGVuZCAoKSB7CiAJcm0gLXJmICR7RH0ke2xpYmRpcn0vbGliY3J5cHQuc28KIAlybSAtcmYgJHtE
fSR7ZGF0YWRpcn0KIH0KKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0
L2xpYnhjcnlwdC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0Lmlu
YwppbmRleCBlZTY4NzVhYTA1Li45ZWNiMzMzZmI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4
Y3J5cHQvbGlieGNyeXB0LmluYwpAQCAtOSwxMyArOSwxMiBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNJTkc7bWQ1PWMwYTMwZTJiMTUwMmM1NWE3ZjM3ZTQxMmNkNmM2YTRiIFwK
IAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2JyYW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9
aHR0cHMiCi1TUkNSRVYgPSAiZjUzMWEzNmFhOTE2YTIyZWYyY2U3ZDI3MGJhMzgxZTI2NDI1MGNi
ZiIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2Jy
YW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9aHR0cHMgXAorICAgICAgICAgICBmaWxlOi8vZml4
X2NmbGFnc19oYW5kbGluZy5wYXRjaCBcCisgICAgICAgICAgICIKK1NSQ1JFViA9ICJlNTcxNGQx
ZjBhNDc3ZjkxY2UzOTg2ZmE2MzY1MWM3NzEwZjBlMTgzIgogU1JDQlJBTkNIID89ICJtYXN0ZXIi
CiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9maXhfY2ZsYWdzX2hhbmRsaW5nLnBhdGNoIFwKLSAgICAg
ICAgICAgIGZpbGU6Ly9jb25maWd1cmUtYzk5LnBhdGNoIgotCiBQUk9WSURFUyA9ICJ2aXJ0dWFs
L2NyeXB0IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQuMzYuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4Y3J5cHQvbGlieGNyeXB0XzQuNC4zNy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjQuMzYuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC40LjM3LmJiCi0t
IAoyLjQ0LjEKCg==

--===============7354013190243993539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 48 recipes from the core2-64 sysroot...done.
Removing 54 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

--===============7354013190243993539==--

