Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8587DCD6E71
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1552.1780328129481884145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ix6zRFG7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f+POSx7S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d3c820-f823e6c0-0527-435e-9aa9-3be82be89ffc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7+l8Sp4zy53ZMBL5wg6q2VJLsoF6AfUg314zUSEgl4w=;
	b=ix6zRFG7UBpxwqMCKsNqD8y+u6Ew6UR9l9he/UaJ8PKUVeeCEfIw88nDj/NALVl+
	E45GT7dzqNrkFNflgV3zp7z/p1XSUFDRK7YYSPauDNKIKbtCgqUsnNbl2oNTGxd2k0s
	VASHLixJZnRkJ68qsIWAS3z7WlolbtJ2rpvneMGE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7+l8Sp4zy53ZMBL5wg6q2VJLsoF6AfUg314zUSEgl4w=;
	b=f+POSx7SD+BiyFm3U6HnIZY2199Ezip2FIJxzmEphdV8QNoaEuNSA2ZWxGsopW/H
	BsSSy9u33btUBChM2xu+cffSzVW2YYUNFlnAHWKfepk7PQ+e7eQy3U1zh5p0qQ1JDzU
	ZHKcIQrMTagPkQb3w2yF2U9iE3YO8dUGJaN/7Joc=
Content-Type: multipart/mixed; boundary="===============7111753385187243790=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101019e83d3c820-f823e6c0-0527-435e-9aa9-3be82be89ffc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237952

--===============7111753385187243790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-2.0.1-2.1.0.patch
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
From 56841c190ac9b5fe2279532ebc534c9d56180aa6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:26:08 +0000
Subject: [PATCH] gpgme: upgrade 2.0.1 -> 2.1.0

---
 ...uild-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch |  5 +----
 .../0001-autogen.sh-remove-unknown-in-version.patch   |  6 +++---
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch | 11 ++++-------
 ...0001-posix-io.c-Use-off_t-instead-of-off64_t.patch |  4 ++--
 .../0001-use-closefrom-on-linux-and-glibc-2.34.patch  |  6 +++---
 ...nfig-skip-all-lib-or-usr-lib-directories-in-.patch |  2 +-
 .../gpgme/{gpgme_2.0.1.bb => gpgme_2.1.0.bb}          |  2 +-
 7 files changed, 15 insertions(+), 21 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.0.1.bb => gpgme_2.1.0.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 4b8d1ceecd..f3b42aa1ae 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
+From df6d3712376f44254cf1acca3ba460a96fedf377 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
@@ -113,6 +113,3 @@ index acbfc1c..5f689e1 100644
      AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 890909dd5e..63c5a46f70 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
+From 7545fb5e0520fc9780376310a7ea484fc815b0d9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9f91297..9f7559b 100755
+index 71f89e2..6b407e2 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -271,7 +271,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -286,7 +286,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 67b65157d1..77e462838a 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
+From bbe0b74081f21442696e409ed15322183b69553a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,10 +29,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d4dcb1c..293fcc2 100644
+index a01a8c1..8b0dc40 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -844,6 +844,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme.pc
                  src/gpgme-glib.pc
                  src/gpgme.h)
@@ -41,7 +41,7 @@ index d4dcb1c..293fcc2 100644
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
  AC_CONFIG_FILES([lang/js/Makefile lang/js/src/Makefile
 diff --git a/src/Makefile.am b/src/Makefile.am
-index edc239b..d427044 100644
+index 4f45dfe..3c49190 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -295,6 +295,3 @@ index 9ddef5c..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 932fb9c962..b8681ed113 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
+From c03515f3fb1720e8e78f73708f9fbbbc8407268b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index 0d0a98b..286a626 100644
+index 4dee776..3b99500 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
 @@ -74,8 +74,8 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index ed2edabd63..f7398ee72f 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
+From 506ecc28aa4376ec4c4e6227be7c937c0d8d3612 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index a422d8f..0d0a98b 100644
+index f8196f9..4dee776 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
-@@ -577,7 +577,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+@@ -599,7 +599,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index c021e48be9..7247404408 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
+From 1f063f06e5ddc39fba2ae60dd68b8a57a3da1b80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.0.1.bb b/meta/recipes-support/gpgme/gpgme_2.1.0.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.0.1.bb
rename to meta/recipes-support/gpgme/gpgme_2.1.0.bb
index ae20f785e6..269070b10b 100644
--- a/meta/recipes-support/gpgme/gpgme_2.0.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.0.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "821ab0695c842eab51752a81980c92b0410c7eadd04103f791d5d2a526784966"
+SRC_URI[sha256sum] = "841c5ea53fc26259f4fbf0e8bde982dea1b8a1ca0cb77e681c82b050566bf92b"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.47.1


--===============7111753385187243790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.0.1", added "/usr/lib/libgpgme.so.45.1.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so.45.0.1 moved to /usr/lib/libgpgme.so.45.1.0

--===============7111753385187243790==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.0.1-2.1.0.patch"

RnJvbSA1Njg0MWMxOTBhYzliNWZlMjI3OTUzMmViYzUzNGM5ZDU2MTgwYWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDoyNjowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdw
Z21lOiB1cGdyYWRlIDIuMC4xIC0+IDIuMS4wCgotLS0KIC4uLnVpbGQtTWFrZS1ncGdtZS5tNC11
c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoIHwgIDUgKy0tLS0KIC4uLi8wMDAxLWF1dG9n
ZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCAgIHwgIDYgKysrLS0tCiBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaCB8IDExICsr
KystLS0tLS0tCiAuLi4wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRf
dC5wYXRjaCB8ICA0ICsrLS0KIC4uLi8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWds
aWJjLTIuMzQucGF0Y2ggIHwgIDYgKysrLS0tCiAuLi5uZmlnLXNraXAtYWxsLWxpYi1vci11c3It
bGliLWRpcmVjdG9yaWVzLWluLS5wYXRjaCB8ICAyICstCiAuLi4vZ3BnbWUve2dwZ21lXzIuMC4x
LmJiID0+IGdwZ21lXzIuMS4wLmJifSAgICAgICAgICB8ICAyICstCiA3IGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL3tncGdtZV8yLjAuMS5iYiA9PiBncGdtZV8yLjEuMC5iYn0gKDk2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1i
dWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1idWlsZC1NYWtlLWdwZ21l
Lm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2gKaW5kZXggNGI4ZDFjZWVjZC4uZjNi
NDJhYTFhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1
aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNmFkMWFjOGMwM2FlM2FjYzA1MzlmYzE1NjYwNzBlMjQ2OGM3ZGYwYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGY2ZDM3MTIzNzZmNDQyNTRjZjFhY2NhM2Jh
NDYwYTk2ZmVkZjM3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEg
PGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTQgT2N0IDIwMjUgMTQ6MTI6
NTUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJidWlsZDogTWFrZSBncGdtZS5tNCB1
c2UgZ3BncnQtY29uZmlnIHdpdGggKi5wYy4iCkBAIC0xMTMsNiArMTEzLDMgQEAgaW5kZXggYWNi
ZmMxYy4uNWY2ODllMSAxMDA2NDQKICAgICAgQUNfTVNHX1JFU1VMVCh5ZXMpCiAgICAgIGlmZWxz
ZShbJDJdLCAsIDosIFskMl0pCiAgICAgIF9BTV9QQVRIX0dQR01FX0NPTkZJR19IT1NUX0NIRUNL
Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5r
bm93bi1pbi12ZXJzaW9uLnBhdGNoCmluZGV4IDg5MDkwOWRkNWUuLjYzYzVhNDZmNzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1y
ZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYmI3ZmRkYjZhNzY4YmJjNDY2OTVkZTRjNmUwMjU2
YTM1ODBjY2JiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NTQ1ZmI1ZTA1MjBmYzk3
ODAzNzYzMTBhN2VhNDg0ZmM4MTViMGQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBOb3Yg
MjAyNCAyMzoyMzo0MiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2VuLnNoOiByZW1vdmUg
Jy11bmtub3duJyBpbiB2ZXJzaW9uCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvYXV0b2dlbi5zaCBi
L2F1dG9nZW4uc2gKLWluZGV4IDlmOTEyOTcuLjlmNzU1OWIgMTAwNzU1CitpbmRleCA3MWY4OWUy
Li42YjQwN2UyIDEwMDc1NQogLS0tIGEvYXV0b2dlbi5zaAogKysrIGIvYXV0b2dlbi5zaAotQEAg
LTI3MSw3ICsyNzEsNyBAQCBpZiBbICIkbXlob3N0IiA9ICJmaW5kLXZlcnNpb24iIF07IHRoZW4K
K0BAIC0yODYsNyArMjg2LDcgQEAgaWYgWyAiJG15aG9zdCIgPSAiZmluZC12ZXJzaW9uIiBdOyB0
aGVuCiAgICAgIGVsc2UKICAgICAgICBpbmdpdD1ubwogICAgICAgIGJldGE9eWVzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNo
CmluZGV4IDY3YjY1MTU3ZDEuLjc3ZTQ2MjgzOGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0YjRlNmZjODk4ZGQyNDkzODdiYmVkNDkyNGZhMjJjMWM0OTQzMjdhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYmUwYjc0MDgxZjIxNDQyNjk2ZTQwOWVkMTUzMjIxODNi
Njk1NTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyMSBKdWwgMjAyNSAxMjo0MzoyOSArMDgw
MAogU3ViamVjdDogW1BBVENIXSBwa2djb25maWcKQEAgLTI5LDEwICsyOSwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNyYy9ncGdtZS1wdGhyZWFkLnBjLmluCiAKIGRpZmYgLS1naXQgYS9jb25maWd1
cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGQ0ZGNiMWMuLjI5M2ZjYzIgMTAwNjQ0CitpbmRl
eCBhMDFhOGMxLi44YjBkYzQwIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25m
aWd1cmUuYWMKLUBAIC04NDQsNiArODQ0LDcgQEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNy
Yy9NYWtlZmlsZQorQEAgLTg0NSw2ICs4NDUsNyBAQCBBQ19DT05GSUdfRklMRVMoTWFrZWZpbGUg
c3JjL01ha2VmaWxlCiAgICAgICAgICAgICAgICAgIHNyYy9ncGdtZS5wYwogICAgICAgICAgICAg
ICAgICBzcmMvZ3BnbWUtZ2xpYi5wYwogICAgICAgICAgICAgICAgICBzcmMvZ3BnbWUuaCkKQEAg
LTQxLDcgKzQxLDcgQEAgaW5kZXggZDRkY2IxYy4uMjkzZmNjMiAxMDA2NDQKICBBQ19DT05GSUdf
RklMRVMoW2xhbmcvTWFrZWZpbGUgbGFuZy9jbC9NYWtlZmlsZSBsYW5nL2NsL2dwZ21lLmFzZF0p
CiAgQUNfQ09ORklHX0ZJTEVTKFtsYW5nL2pzL01ha2VmaWxlIGxhbmcvanMvc3JjL01ha2VmaWxl
CiBkaWZmIC0tZ2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1pbmRleCBl
ZGMyMzliLi5kNDI3MDQ0IDEwMDY0NAoraW5kZXggNGY0NWRmZS4uM2M0OTE5MCAxMDA2NDQKIC0t
LSBhL3NyYy9NYWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCiBAQCAtMjAsMTEgKzIw
LDExIEBACkBAIC0yOTUsNiArMjk1LDMgQEAgaW5kZXggOWRkZWY1Yy4uOTMyNjQ1YiAxMDA2NDQK
ICtDZmxhZ3M6IC1JJHtpbmNsdWRlZGlyfQogK0xpYnM6IC1MJHtsaWJkaXJ9IC1sZ3BnbWUKICBV
Ukw6IGh0dHBzOi8vd3d3LmdudXBnLm9yZy9zb2Z0d2FyZS9ncGdtZS9pbmRleC5odG1sCi0tLSAK
LTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8w
MDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3QtaW5z
dGVhZC1vZi1vZmY2NF90LnBhdGNoCmluZGV4IDkzMmZiOWM5NjIuLmI4NjgxZWQxMTMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1V
c2Utb2ZmX3QtaW5zdGVhZC1vZi1vZmY2NF90LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dwZ21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3QtaW5zdGVhZC1vZi1vZmY2
NF90LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MTcwMzYwNTFjODRiMDJmZTQzZjE2MmVl
Mzc4Mjc4YTQ0NjM2NDUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMDM1MTVmM2Zi
MTcyMGU4ZTc4ZjczNzA4ZjlmYmJiYzg0MDcyNjhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgRGVjIDIw
MjIgMDg6NDQ6MTMgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcG9zaXgtaW8uYzogVXNlIG9mZl90
IGluc3RlYWQgb2Ygb2ZmNjRfdApAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvcG9zaXgtaW8uYyBiL3NyYy9w
b3NpeC1pby5jCi1pbmRleCAwZDBhOThiLi4yODZhNjI2IDEwMDY0NAoraW5kZXggNGRlZTc3Ni4u
M2I5OTUwMCAxMDA2NDQKIC0tLSBhL3NyYy9wb3NpeC1pby5jCiArKysgYi9zcmMvcG9zaXgtaW8u
YwogQEAgLTc0LDggKzc0LDggQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dw
Z21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1v
bi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaAppbmRleCBlZDJlZGFiZDYzLi5mNzM5OGVlNzJm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVzZS1j
bG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGli
Yy0yLjM0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhYWVkMDNiNzY1MDViMWZlYWVlYjVh
NGEzYzZiZGNjN2RkMDg5ZjAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MDZlY2My
OGFhNDM3NmVjNGM0ZTYyMjdiZTdjOTM3YzBkOGQzNjEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgSnVs
IDIwMjEgMTI6MzM6MTMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIGNsb3NlZnJvbSgpIG9u
IGxpbnV4IGFuZCBnbGliYyAyLjM0KwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6
IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvcG9zaXgtaW8uYyBi
L3NyYy9wb3NpeC1pby5jCi1pbmRleCBhNDIyZDhmLi4wZDBhOThiIDEwMDY0NAoraW5kZXggZjgx
OTZmOS4uNGRlZTc3NiAxMDA2NDQKIC0tLSBhL3NyYy9wb3NpeC1pby5jCiArKysgYi9zcmMvcG9z
aXgtaW8uYwotQEAgLTU3Nyw3ICs1NzcsNyBAQCBfZ3BnbWVfaW9fc3Bhd24gKGNvbnN0IGNoYXIg
KnBhdGgsIGNoYXIgKmNvbnN0IGFyZ3ZbXSwgdW5zaWduZWQgaW50IGZsYWdzLAorQEAgLTU5OSw3
ICs1OTksNyBAQCBfZ3BnbWVfaW9fc3Bhd24gKGNvbnN0IGNoYXIgKnBhdGgsIGNoYXIgKmNvbnN0
IGFyZ3ZbXSwgdW5zaWduZWQgaW50IGZsYWdzLAogICAgICAgICAgICAgICAgaWYgKGZkX2xpc3Rb
aV0uZmQgPiBmZCkKICAgICAgICAgICAgICAgICAgZmQgPSBmZF9saXN0W2ldLmZkOwogICAgICAg
ICAgICAgIGZkKys7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZS8wMDA1LWdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1p
bi0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNv
bmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKaW5kZXgg
YzAyMWU0OGJlOS4uNzI0NzQwNDQwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGly
ZWN0b3JpZXMtaW4tLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21l
LzAwMDUtZ3BnbWUtY29uZmlnLXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWlu
LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWVhNjg1ZjFiODk4ZWU3MDNiODViNzA1YzM1
YjljYmQ3N2NjYTE3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWYwNjNmMDZlNWRk
YzM5ZmJhMmFlNjBkZDY4YjhhNTdhM2RhMWI4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1
LCAxMyBBcHIgMjAxNyAxNjo0MDoyNyArMDMwMAogU3ViamVjdDogW1BBVENIXSBncGdtZS1jb25m
aWc6IHNraXAgYWxsIC9saWIqIG9yIC91c3IvbGliKiBkaXJlY3RvcmllcyBpbgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4wLjEuYmIgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZV8yLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZV8yLjAuMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjAuYmIKaW5kZXggYWUyMGY3
ODVlNi4uMjY5MDcwYjEwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWVfMi4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4x
LjAuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0vZ3BnbWUv
JHtCUH0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWF1dG9nZW4uc2gtcmVtb3Zl
LXVua25vd24taW4tdmVyc2lvbi5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjgyMWFiMDY5NWM4NDJlYWI1MTc1MmE4MTk4MGM5MmIwNDEwYzdlYWRkMDQxMDNm
NzkxZDVkMmE1MjY3ODQ5NjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQxYzVlYTUzZmMyNjI1
OWY0ZmJmMGU4YmRlOTgyZGVhMWI4YTFjYTBjYjc3ZTY4MWM4MmIwNTA1NjZiZjkyYiIKIAogREVQ
RU5EUyA9ICJsaWJncGctZXJyb3ItbmF0aXZlIGxpYmdwZy1lcnJvciBsaWJhc3N1YW4iCiAKLS0g
CjIuNDcuMQoK

--===============7111753385187243790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2267416 to 2275632 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.0.1", added "/usr/lib/.debug/libgpgme.so.45.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 105967 to 106699 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 474423 to 476998 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1332922 to 1340856 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.0.1/src -> /usr/src/debug/gpgme/2.1.0/src, directory renamed /usr/src/debug/gpgme/2.0.1/tools -> /usr/src/debug/gpgme/2.1.0/tools
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGSIZE changed from 487618 to 487650 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.0.1", added "/usr/lib/libgpgme.so.45.1.0"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.0.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.0.1" to "2.1.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so.45.0.1 moved to /usr/lib/libgpgme.so.45.1.0

--===============7111753385187243790==--

