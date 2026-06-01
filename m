Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D11BCD8CAA
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1559.1780328132630584587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VytV7QWo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tgdZ3JqN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3a52f-ea58303b-d3dc-4e86-8841-cc65fc3353ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NzjnToDXHKMg6uplvtHlVJZGV1grQKNh3mdsRthis6Y=;
	b=VytV7QWoH9gF1F17UeiamcMKbla3FCj1GQK/g6OD6Lx/ft9vkLQAWFFqiPnl588i
	kZmZrFEXM7lKo/wewMsWolRnRUFtWCqy1T0csWU6HwfMfCrdYoIz28WC4yEZYtDnb7q
	hJsQiK0ZWa5EE1ZCSIwsDCG7lIRuBsfY/ZgD31FI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NzjnToDXHKMg6uplvtHlVJZGV1grQKNh3mdsRthis6Y=;
	b=tgdZ3JqNS9N4z6EykfbvcRLdnVe9IZl3bKB8XI7MrAaSYkhY/kToX3+QNkzp3A8l
	rY34OuHPmJG2wr829pHF8dAvAMGls9n9n/DOOfPiSNVT85C/oLw6vqkN2CGPW+TkRy0
	+D77x/6Cr3HrYNxmxEw8ENqZGG12QJB84DhXQ1NY=
Content-Type: multipart/mixed; boundary="===============6320158210426865525=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.07.1 SUCCEEDED
Message-ID: <0101019e83d3a52f-ea58303b-d3dc-4e86-8841-cc65fc3353ae-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237908

--===============6320158210426865525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ghostscript* to *10.07.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.07.0-10.07.1.patch
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
From 4a96a771810537599e7f752d0384cbdebf9b703d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:36:38 +0000
Subject: [PATCH] ghostscript: upgrade 10.07.0 -> 10.07.1

---
 ...ace-static-const-double-with-macros-.patch |  4 +--
 .../avoid-host-contamination.patch            |  4 +--
 .../ghostscript-9.16-Werror-return-type.patch |  2 +-
 .../ghostscript/ghostscript/out-of-tree.patch | 30 ++++++++-----------
 ...ript_10.07.0.bb => ghostscript_10.07.1.bb} |  2 +-
 5 files changed, 19 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.07.0.bb => ghostscript_10.07.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
index 6f310abf2e..36372389b7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
@@ -1,4 +1,4 @@
-From 0298799777bd179c455e5ce8d6008b2d84732967 Mon Sep 17 00:00:00 2001
+From c2f9ccfe12c6c7b29a41baab63670e0cad770bf5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 7 Apr 2026 22:40:26 -0700
 Subject: [PATCH] psi/ztype.c: replace static const double with macros for
@@ -28,6 +28,6 @@ index a01d83f..d454778 100644
 +
 +#define min_int_real ((double)(ALT_MIN_INT) - 1.0)
 +#define max_int_real ((double)(ALT_MAX_INT) + 1.0)
-
+ 
  #define REAL_CAN_BE_INT(v)\
    ((v) > min_int_real && (v) < max_int_real)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index d191231c7b..5c78eab9c2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
+From 6ead8ba80a4d0b65e427a2ba227d3c98923bd5d2 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index a5dbc7a..27b55f2 100644
+index 1e44e8d..f4d95da 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
 @@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 0598c3dcd2..6883b475cc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,4 +1,4 @@
-From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
+From 8e9e75e92e3a78aba5dae2eff288be37d544ce88 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
 Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index 202c9d6c7c..b20eb30df7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,14 +1,21 @@
-Fix the build to do out-of-tree properly.
+From bf1baaa9499a01cd99076d183eaa741ea8a9ed92 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 2 Apr 2026 14:41:42 +0100
+Subject: [PATCH] Fix the build to do out-of-tree properly.
 
 The patches are in progress but are being submitted upstream.
 
 Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709289]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -rU3 a/configure.ac b/configure.ac
---- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
-+++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
-@@ -400,7 +400,7 @@
+diff --git a/configure.ac b/configure.ac
+index b2b3678..dd00e86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -400,7 +400,7 @@ if test x"$with_arch_h" = x""; then
            *)
              ARCH_CONF_HEADER=
              if test x"$host" != x"$build"; then
@@ -17,18 +24,7 @@ diff -rU3 a/configure.ac b/configure.ac
              else
                ARCH_CONF_HEADER=
              fi
-@@ -869,8 +869,8 @@
- AC_SUBST(RECURSIVE_MUTEXATTR)
- 
- dnl Tesseract/Leptonica detection
--TESSERACTDIR=tesseract
--LEPTONICADIR=leptonica
-+TESSERACTDIR=$srcdir/tesseract
-+LEPTONICADIR=$srcdir/leptonica
- OCR_VERSION=0
- OCR_SHARED=0
- LEPTONICAINCLUDE=
-@@ -886,7 +886,7 @@
+@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-tesseract],
  
  if test x$with_tesseract != xno; then
    AC_MSG_CHECKING([for local Tesseract library source])
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
index 1b6cb4aaae..3254872036 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
-SRC_URI[sha256sum] = "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0beb897c37885b5cad"
+SRC_URI[sha256sum] = "2fc74362f9be6fae1b0a65d38fdcfd4f0b518cc3b07c5581fb661eb4d2e15251"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.1


--===============6320158210426865525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.07.0 -> /usr/share/doc/ghostscript/10.07.1
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.1/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.07.0/Resource/Decoding -> /usr/share/ghostscript/10.07.1/Resource/Decoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/CMap -> /usr/share/ghostscript/10.07.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.07.0/Resource/Init -> /usr/share/ghostscript/10.07.1/Resource/Init, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.1/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.07.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.1/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.07.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.1/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.07.0/lib -> /usr/share/ghostscript/10.07.1/lib, directory renamed
  /usr/share/ghostscript/10.07.0/Resource/Encoding -> /usr/share/ghostscript/10.07.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.1/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.07.0/iccprofiles -> /usr/share/ghostscript/10.07.1/iccprofiles, directory renamed /usr/share/ghostscript/10.07.0/Resource/Font -> /usr/share/ghostscript/10.07.1/Resource/Font
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.07.0 moved to /usr/share/ghostscript/10.07.1

--===============6320158210426865525==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.07.0-10.07.1.patch"

RnJvbSA0YTk2YTc3MTgxMDUzNzU5OWU3Zjc1MmQwMzg0Y2JkZWJmOWI3MDNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDozNjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdo
b3N0c2NyaXB0OiB1cGdyYWRlIDEwLjA3LjAgLT4gMTAuMDcuMQoKLS0tCiAuLi5hY2Utc3RhdGlj
LWNvbnN0LWRvdWJsZS13aXRoLW1hY3Jvcy0ucGF0Y2ggfCAgNCArLS0KIC4uLi9hdm9pZC1ob3N0
LWNvbnRhbWluYXRpb24ucGF0Y2ggICAgICAgICAgICB8ICA0ICstLQogLi4uL2dob3N0c2NyaXB0
LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoIHwgIDIgKy0KIC4uLi9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdC9vdXQtb2YtdHJlZS5wYXRjaCB8IDMwICsrKysrKysrLS0tLS0tLS0tLS0KIC4u
LnJpcHRfMTAuMDcuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wNy4xLmJifSB8ICAyICstCiA1IGZp
bGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC97Z2hvc3RzY3JpcHRfMTAuMDcuMC5iYiA9
PiBnaG9zdHNjcmlwdF8xMC4wNy4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8wMDAxLXBzaS16dHlwZS5jLXJlcGxh
Y2Utc3RhdGljLWNvbnN0LWRvdWJsZS13aXRoLW1hY3Jvcy0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvMDAwMS1wc2ktenR5cGUuYy1yZXBsYWNl
LXN0YXRpYy1jb25zdC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoCmluZGV4IDZmMzEwYWJmMmUu
LjM2MzcyMzg5YjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlw
dC9naG9zdHNjcmlwdC8wMDAxLXBzaS16dHlwZS5jLXJlcGxhY2Utc3RhdGljLWNvbnN0LWRvdWJs
ZS13aXRoLW1hY3Jvcy0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0LzAwMDEtcHNpLXp0eXBlLmMtcmVwbGFjZS1zdGF0aWMtY29uc3QtZG91
YmxlLXdpdGgtbWFjcm9zLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDI5ODc5OTc3N2Jk
MTc5YzQ1NWU1Y2U4ZDYwMDhiMmQ4NDczMjk2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYzJmOWNjZmUxMmM2YzdiMjlhNDFiYWFiNjM2NzBlMGNhZDc3MGJmNSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgog
RGF0ZTogVHVlLCA3IEFwciAyMDI2IDIyOjQwOjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBz
aS96dHlwZS5jOiByZXBsYWNlIHN0YXRpYyBjb25zdCBkb3VibGUgd2l0aCBtYWNyb3MgZm9yCkBA
IC0yOCw2ICsyOCw2IEBAIGluZGV4IGEwMWQ4M2YuLmQ0NTQ3NzggMTAwNjQ0CiArCiArI2RlZmlu
ZSBtaW5faW50X3JlYWwgKChkb3VibGUpKEFMVF9NSU5fSU5UKSAtIDEuMCkKICsjZGVmaW5lIG1h
eF9pbnRfcmVhbCAoKGRvdWJsZSkoQUxUX01BWF9JTlQpICsgMS4wKQotCisgCiAgI2RlZmluZSBS
RUFMX0NBTl9CRV9JTlQodilcCiAgICAoKHYpID4gbWluX2ludF9yZWFsICYmICh2KSA8IG1heF9p
bnRfcmVhbCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdC9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1pbmF0aW9u
LnBhdGNoCmluZGV4IGQxOTEyMzFjN2IuLjVjNzhlYWI5YzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9hdm9pZC1ob3N0LWNvbnRhbWlu
YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0
c2NyaXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gODU5MDVjZTNiMWJjNjNmMGJlOWVkYTk4ODhlNDBkOGU3YTgwM2QyMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNmVhZDhiYTgwYTRkMGI2NWU0MjdhMmJhMjI3ZDNjOTg5MjNiZDVk
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5k
cml2ZXIuY29tPgogRGF0ZTogVGh1LCAyOSBNYXIgMjAxOCAxNjowMjowNSArMDgwMAogU3ViamVj
dDogW1BBVENIXSBhdm9pZCBob3N0IGNvbnRhbWluYXRpb24KQEAgLTE1LDcgKzE1LDcgQEAgU2ln
bmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
ZGV2aWNlcy9kZXZzLm1hayBiL2RldmljZXMvZGV2cy5tYWsKLWluZGV4IGE1ZGJjN2EuLjI3YjU1
ZjIgMTAwNjQ0CitpbmRleCAxZTQ0ZThkLi5mNGQ5NWRhIDEwMDY0NAogLS0tIGEvZGV2aWNlcy9k
ZXZzLm1hawogKysrIGIvZGV2aWNlcy9kZXZzLm1hawogQEAgLTQwMyw3ICs0MDMsNyBAQCAkKERF
Vk9CSilnZGV2eGFsdC4kKE9CSikgOiAkKERFVlNSQylnZGV2eGFsdC5jICQoR0RFVlgpICQobWF0
aF9faCkgJChtZW1vcnlfX2gpXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2do
b3N0c2NyaXB0L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2do
b3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoCmluZGV4IDA1OThjM2RjZDIu
LjY4ODNiNDc1Y2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlw
dC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGMyM2I3ODdmOWEzOGJlMmNkYzU3MTMzOTE1YzQwMmI2OWFjZWRkMWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDhlOWU3NWU5MmUzYTc4YWJhNWRhZTJlZmYyODhiZTM3ZDU0NGNlODgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdA
d2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgNCBNYXkgMjAxNSAyMjozMTo0OCAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBiYXNlL2dlbmRldi5jOiBmaXggZm9yIC1XZXJyb3I9cmV0dXJuLXR5cGUK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlw
dC9vdXQtb2YtdHJlZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdC9vdXQtb2YtdHJlZS5wYXRjaAppbmRleCAyMDJjOWQ2YzdjLi5iMjBlYjMwZGY3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3Jp
cHQvb3V0LW9mLXRyZWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0L291dC1vZi10cmVlLnBhdGNoCkBAIC0xLDE0ICsxLDIxIEBACi1GaXgg
dGhlIGJ1aWxkIHRvIGRvIG91dC1vZi10cmVlIHByb3Blcmx5LgorRnJvbSBiZjFiYWFhOTQ5OWEw
MWNkOTkwNzZkMTgzZWFhNzQxZWE4YTllZDkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CitEYXRlOiBUaHUsIDIgQXByIDIw
MjYgMTQ6NDE6NDIgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IHRoZSBidWlsZCB0byBkbyBv
dXQtb2YtdHJlZSBwcm9wZXJseS4KIAogVGhlIHBhdGNoZXMgYXJlIGluIHByb2dyZXNzIGJ1dCBh
cmUgYmVpbmcgc3VibWl0dGVkIHVwc3RyZWFtLgogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCBbaHR0cHM6Ly9idWdzLmdob3N0c2NyaXB0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9NzA5Mjg5XQog
U2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CistLS0KKyBj
b25maWd1cmUuYWMgfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogCi1kaWZmIC1yVTMgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMK
LS0tLSBhL2NvbmZpZ3VyZS5hYwkyMDI1LTA5LTA5IDEwOjM2OjM5LjAwMDAwMDAwMCArMDEwMAot
KysrIGIvY29uZmlndXJlLmFjCTIwMjYtMDMtMzEgMTU6MzU6MDguOTg4MjYyNjEyICswMTAwCi1A
QCAtNDAwLDcgKzQwMCw3IEBACitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCitpbmRleCBiMmIzNjc4Li5kZDAwZTg2IDEwMDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisr
KysgYi9jb25maWd1cmUuYWMKK0BAIC00MDAsNyArNDAwLDcgQEAgaWYgdGVzdCB4IiR3aXRoX2Fy
Y2hfaCIgPSB4IiI7IHRoZW4KICAgICAgICAgICAgKikKICAgICAgICAgICAgICBBUkNIX0NPTkZf
SEVBREVSPQogICAgICAgICAgICAgIGlmIHRlc3QgeCIkaG9zdCIgIT0geCIkYnVpbGQiOyB0aGVu
CkBAIC0xNywxOCArMjQsNyBAQCBkaWZmIC1yVTMgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICBBUkNIX0NPTkZfSEVBREVSPQog
ICAgICAgICAgICAgIGZpCi1AQCAtODY5LDggKzg2OSw4IEBACi0gQUNfU1VCU1QoUkVDVVJTSVZF
X01VVEVYQVRUUikKLSAKLSBkbmwgVGVzc2VyYWN0L0xlcHRvbmljYSBkZXRlY3Rpb24KLS1URVNT
RVJBQ1RESVI9dGVzc2VyYWN0Ci0tTEVQVE9OSUNBRElSPWxlcHRvbmljYQotK1RFU1NFUkFDVERJ
Uj0kc3JjZGlyL3Rlc3NlcmFjdAotK0xFUFRPTklDQURJUj0kc3JjZGlyL2xlcHRvbmljYQotIE9D
Ul9WRVJTSU9OPTAKLSBPQ1JfU0hBUkVEPTAKLSBMRVBUT05JQ0FJTkNMVURFPQotQEAgLTg4Niw3
ICs4ODYsNyBAQAorQEAgLTg4OSw3ICs4ODksNyBAQCBBQ19BUkdfV0lUSChbdGVzc2VyYWN0XSwg
QVNfSEVMUF9TVFJJTkcoWy0td2l0aG91dC10ZXNzZXJhY3RdLAogIAogIGlmIHRlc3QgeCR3aXRo
X3Rlc3NlcmFjdCAhPSB4bm87IHRoZW4KICAgIEFDX01TR19DSEVDS0lORyhbZm9yIGxvY2FsIFRl
c3NlcmFjdCBsaWJyYXJ5IHNvdXJjZV0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDcuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNj
cmlwdF8xMC4wNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHRfMTAuMDcuMS5iYgppbmRleCAxYjZjYjRhYWFlLi4zMjU0ODcyMDM2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRf
MTAuMDcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHRfMTAuMDcuMS5iYgpAQCAtMjgsNyArMjgsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvZ2hvc3RwZGwtZG93bmxvYWRzL3JlbGVhc2VzL2Rvd25s
bwogICAgICAgICAgICBmaWxlOi8vMDAwMS1wc2ktenR5cGUuYy1yZXBsYWNlLXN0YXRpYy1jb25z
dC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZWQ2ZWE2MjAyMmUzZjRkNWE2NTY5YjZlZmM5MzYxYjYzYTZkMTE4YmZjYWQ4
ZjBiZWI4OTdjMzc4ODViNWNhZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyZmM3NDM2MmY5YmU2
ZmFlMWIwYTY1ZDM4ZmRjZmQ0ZjBiNTE4Y2MzYjA3YzU1ODFmYjY2MWViNGQyZTE1MjUxIgogCiBQ
QUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJR1tndGtdID0gIi0tZW5hYmxlLWd0aywt
LWRpc2FibGUtZ3RrLGd0ayszIgotLSAKMi40Ny4xCgo=

--===============6320158210426865525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 214034912 to 209308144 (-2%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.07.0 -> /usr/share/doc/ghostscript/10.07.1
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11329961 to 11329224 (-0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: FILELIST: directory renamed /usr/src/debug/ghostscript/10.07.0/psi -> /usr/src/debug/ghostscript/10.07.1/psi, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/classify -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/classify, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccstruct -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccstruct, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/dict -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/dict, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/opvp -> /usr/src/debug/ghostscript/10.07.1/contrib/opvp, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/arch -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/arch, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/lstm -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/lstm, directory renamed /usr/src/debug/ghostscript/
 10.07.0/openjpeg/src/lib/openjp2 -> /usr/src/debug/ghostscript/10.07.1/openjpeg/src/lib/openjp2, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/api -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/api, directory renamed /usr/src/debug/ghostscript/10.07.0/obj -> /usr/src/debug/ghostscript/10.07.1/soobj, directory renamed /usr/src/debug/ghostscript/10.07.0/pdf -> /usr/src/debug/ghostscript/10.07.1/pdf, directory renamed /usr/src/debug/ghostscript/10.07.0/soobj -> /usr/src/debug/ghostscript/10.07.1/obj, directory renamed /usr/src/debug/ghostscript/10.07.0/jbig2dec -> /usr/src/debug/ghostscript/10.07.1/jbig2dec, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccmain -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccmain, directory renamed /usr/src/debug/ghostscript/10.07.0/lcms2mt/src -> /usr/src/debug/ghostscript/10.07.1/lcms2mt/src, directory renamed /usr/src/debug/ghostscript/10.07.0/urf -> /usr/src/debug/ghostscript/10.07.1/urf, director
 y renamed /usr/src/debug/ghostscript/10.07.0/zlib -> /usr/src/debug/ghostscript/10.07.1/zlib, directory renamed /usr/src/debug/ghostscript/10.07.0/brotli/c/include/brotli -> /usr/src/debug/ghostscript/10.07.1/brotli/c/include/brotli, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/eplaser -> /usr/src/debug/ghostscript/10.07.1/contrib/eplaser, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/src -> /usr/src/debug/ghostscript/10.07.1/contrib/pcl3/src, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/japanese -> /usr/src/debug/ghostscript/10.07.1/contrib/japanese, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/lips4 -> /usr/src/debug/ghostscript/10.07.1/contrib/lips4, directory renamed /usr/src/debug/ghostscript/10.07.0/devices/rinkj -> /usr/src/debug/ghostscript/10.07.1/devices/rinkj, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/include/tesseract -> /usr/src/debug/ghostscript/10.07.1/tesseract/include/tesseract,
  directory renamed /usr/src/debug/ghostscript/10.07.0/cups -> /usr/src/debug/ghostscript/10.07.1/cups, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/textord -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/textord, directory renamed /usr/src/debug/ghostscript/10.07.0/lcms2mt/include -> /usr/src/debug/ghostscript/10.07.1/lcms2mt/include, directory renamed /usr/src/debug/ghostscript/10.07.0/base -> /usr/src/debug/ghostscript/10.07.1/base, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccutil -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccutil, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/viewer -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/viewer, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib -> /usr/src/debug/ghostscript/10.07.1/contrib, directory renamed /usr/src/debug/ghostscript/10.07.0/devices -> /usr/src/debug/ghostscript/10.07.1/devices, directory renamed /usr/src/debug/ghostscript/10.
 07.0/devices/vector -> /usr/src/debug/ghostscript/10.07.1/devices/vector, directory renamed /usr/src/debug/ghostscript/10.07.0/leptonica/src -> /usr/src/debug/ghostscript/10.07.1/leptonica/src, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/wordrec -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/wordrec, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/eprn -> /usr/src/debug/ghostscript/10.07.1/contrib/pcl3/eprn, directory renamed /usr/src/debug/ghostscript/10.07.0/ijs -> /usr/src/debug/ghostscript/10.07.1/ijs, removed "/usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compound_dictionary.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compound_dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/cluster_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/bit_reader.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/command.h /usr/src/debug/ghostscript/10.07.0/
 brotli/c/dec/bit_reader.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/command.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/literal_cost.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_encoder_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/dictionary.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/literal_cost.c /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/huffman.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/huffman.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_longest_match_quickly_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/static_dict.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/static_dict.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_longest_match_inc.h /us
 r/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/utf8_util.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_longest_match64_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/utf8_util.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/write_bits.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/prefix.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/prefix.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/context.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/constants.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/find_match_length.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/context.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/consta
 nts.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/static_dict_lut.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/dictionary_hash.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/dictionary_hash.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_rolling_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/cluster.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/shared_dictionary_internal.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/cluster.c /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/state.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment_two_pass.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/state.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment_two_pass.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/state.c
  /usr/src/debug/ghostscript/10.07.0/brotli/c/common/transform.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_forgetful_chain_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/encode.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/bit_cost_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/transform.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/brotli_bit_stream.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/brotli_bit_stream.c /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/decode.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_to_binary_tree_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/params.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode_static.h /usr/src/debug/ghostscript/10
 .07.0/brotli/c/enc/encoder_dict.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/bit_cost.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/encoder_dict.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/quality.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_composite_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/shared_dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/memory.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/platform.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/ringbuffer.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/platform.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/fast_log.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_hq.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_hq.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/fast_log.c", added "/usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter_inc.h /usr
 /src/debug/ghostscript/10.07.1/brotli/c/common/dictionary_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_simd_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/static_init.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_rolling_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/shared_dictionary_internal.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/state.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment_two_pass.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/state.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment_two_pass.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/state.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/transform.h /usr/
 src/debug/ghostscript/10.07.1/brotli/c/enc/encode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_forgetful_chain_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/bit_cost_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/transform.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/brotli_bit_stream.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/brotli_bit_stream.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict_lut_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/decode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_to_binary_tree_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/params.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode_static.h /usr/src/debug/ghostscript/1
 0.07.1/brotli/c/enc/encoder_dict.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/bit_cost.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/encoder_dict.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/quality.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/bit_cost.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_composite_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/shared_dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/memory.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/platform.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/ringbuffer.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/platform.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/fast_log.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_hq.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match64_simd_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_hq.h /
 usr/src/debug/ghostscript/10.07.1/brotli/c/enc/fast_log.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compound_dictionary.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/prefix_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compound_dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/bit_reader.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/command.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/bit_reader.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/command.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/literal_cost.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c
 /enc/block_encoder_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/dictionary.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/literal_cost.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/huffman.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/huffman.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/dictionary_hash_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_quickly_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/utf8_util.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match64_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/utf8_util.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/write_bits.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/prefix.h /usr
 /src/debug/ghostscript/10.07.1/brotli/c/enc/prefix.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/matching_tag_mask.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/context.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/constants.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/find_match_length.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/context.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/constants.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_base.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict_lut.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/static_init.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_init.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/dictio
 nary_hash.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_init.c"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 95068617 to 95143166 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.07.0/Resource/Decoding -> /usr/share/ghostscript/10.07.1/Resource/Decoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/Init -> /usr/share/ghostscript/10.07.1/Resource/Init, directory renamed /usr/share/ghostscript/10.07.0/iccprofiles -> /usr/share/ghostscript/10.07.1/iccprofiles, directory renamed /usr/share/ghostscript/10.07.0/Resource/Encoding -> /usr/share/ghostscript/10.07.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.1/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.07.0/Resource/CMap -> /usr/share/ghostscript/10.07.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.1/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.07.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.1/Resource/ColorSpace,
  directory renamed /usr/share/ghostscript/10.07.0/Resource/Font -> /usr/share/ghostscript/10.07.1/Resource/Font, directory renamed /usr/share/ghostscript/10.07.0/lib -> /usr/share/ghostscript/10.07.1/lib, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.1/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.07.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.1/Resource/IdiomSet
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 95602911 to 95682102 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/ghostscript-10.07.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/ghostscript-10.07.1.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch"
packages/x86-64-v3-poky-linux/ghostscript: PV changed from "10.07.0" to "10.07.1"
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.07.0 moved to /usr/share/ghostscript/10.07.1

--===============6320158210426865525==--

