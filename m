Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFE2CD98E7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50410.1781195498830752471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z9+znSvt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1B9RPz+r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786c275-802a08b6-1add-4759-9087-5f0294fbab0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195523;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=as4RoPdQFc2jrvmhGcYVN8XfIJQ8k24NTdVDI99b7JA=;
	b=Z9+znSvtZZBNYXOHTzdaTpe8K5TggCmglySI3cSsv0GsCPlBwMZkj3VQe/rIzebY
	OWYO/6n7JuajBPEtO0LSyzhhfwbAbSAKC/kjxJLwLUn7m3xvEcGbm2ogwoDyWQ5gAAt
	6kIyRbGky2K9dv6Jed7WCMwjyk0+Tij3y5N9ikeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195523;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=as4RoPdQFc2jrvmhGcYVN8XfIJQ8k24NTdVDI99b7JA=;
	b=1B9RPz+re8WJM4dMJnvkbOY8rGbdoID3skv4ozGrcMHqPzPulSgMlRN/kCegM04P
	sBbwRQ/cz2a/tx2e0h8DSsSTTWllA7UpQ0TSoQ5FIBPV8FsJNV3R0jCwnUciNbDAHHR
	osOWyJqvE0awjuzdjChFUczf531bNkjmKBtkQnwo=
Content-Type: multipart/mixed; boundary="===============4228414947638171493=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101019eb786c275-802a08b6-1add-4759-9087-5f0294fbab0f-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238569

--===============4228414947638171493==
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
From 3a0694d1daaca9813cdcc33011c1c09362bee455 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 15:15:16 +0000
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
index 4b8d1ceecd..29c3c48670 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
+From d8663c7cb62c1db5972e7db23e17aaaaa22f4492 Mon Sep 17 00:00:00 2001
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
index 890909dd5e..4cd8d38488 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
+From fbb0d8cbb3eae2e5eccc59f16fff76d591772410 Mon Sep 17 00:00:00 2001
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
index 67b65157d1..4cfe53fad0 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
+From 34cd082b8d6a7893c054085ef2fc7afa66b9f39a Mon Sep 17 00:00:00 2001
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
index 932fb9c962..a2c757d4ef 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
+From 8e27dff3784039af68c537981c78d5f8b5c23cec Mon Sep 17 00:00:00 2001
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
index ed2edabd63..0cdc4e91af 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
+From 6b6d35523ef1b6d9c7940182ef49e111959f041e Mon Sep 17 00:00:00 2001
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
index c021e48be9..d6445d4d44 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
+From 950651b3226240ef3453270fdca4213d6e42c52c Mon Sep 17 00:00:00 2001
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


--===============4228414947638171493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.0.1", added "/usr/lib/.debug/libgpgme.so.45.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2267416 to 2275632 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 105967 to 106699 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 474423 to 476998 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.0.1/src -> /usr/src/debug/gpgme/2.1.0/src, directory renamed /usr/src/debug/gpgme/2.0.1/tools -> /usr/src/debug/gpgme/2.1.0/tools
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1332922 to 1340856 (+1%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.0.1", added "/usr/lib/libgpgme.so.45.1.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGSIZE changed from 487618 to 487650 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.0.1" to "2.1.0"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.0.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.0.1 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.0.1" to "2.1.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so.45.0.1 moved to /usr/lib/libgpgme.so.45.1.0

--===============4228414947638171493==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.0.1-2.1.0.patch"

RnJvbSAzYTA2OTRkMWRhYWNhOTgxM2NkY2MzMzAxMWMxYzA5MzYyYmVlNDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTU6MTU6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAyLjAuMSAtPiAyLjEuMAoKLS0tCiAuLi51aWxkLU1ha2UtZ3BnbWUubTQt
dXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaCB8ICA1ICstLS0tCiAuLi4vMDAwMS1hdXRv
Z2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggICB8ICA2ICsrKy0tLQogbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2ggfCAxMSAr
KysrLS0tLS0tLQogLi4uMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0
X3QucGF0Y2ggfCAgNCArKy0tCiAuLi4vMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1n
bGliYy0yLjM0LnBhdGNoICB8ICA2ICsrKy0tLQogLi4ubmZpZy1za2lwLWFsbC1saWItb3ItdXNy
LWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2ggfCAgMiArLQogLi4uL2dwZ21lL3tncGdtZV8yLjAu
MS5iYiA9PiBncGdtZV8yLjEuMC5iYn0gICAgICAgICAgfCAgMiArLQogNyBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS97Z3BnbWVfMi4wLjEuYmIgPT4gZ3BnbWVfMi4xLjAuYmJ9ICg5NiUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1SZXZlcnQt
YnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdt
ZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoCmluZGV4IDRiOGQxY2VlY2QuLjI5
YzNjNDg2NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAw
MDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1i
dWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDZhZDFhYzhjMDNhZTNhY2MwNTM5ZmMxNTY2MDcwZTI0NjhjN2RmMGEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ4NjYzYzdjYjYyYzFkYjU5NzJlN2RiMjNl
MTdhYWFhYTIyZjQ0OTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE0IE9jdCAyMDI1IDE0OjEy
OjU1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiYnVpbGQ6IE1ha2UgZ3BnbWUubTQg
dXNlIGdwZ3J0LWNvbmZpZyB3aXRoICoucGMuIgpAQCAtMTEzLDYgKzExMywzIEBAIGluZGV4IGFj
YmZjMWMuLjVmNjg5ZTEgMTAwNjQ0CiAgICAgIEFDX01TR19SRVNVTFQoeWVzKQogICAgICBpZmVs
c2UoWyQyXSwgLCA6LCBbJDJdKQogICAgICBfQU1fUEFUSF9HUEdNRV9DT05GSUdfSE9TVF9DSEVD
SwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVu
a25vd24taW4tdmVyc2lvbi5wYXRjaAppbmRleCA4OTA5MDlkZDVlLi40Y2Q4ZDM4NDg4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gt
cmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGJiN2ZkZGI2YTc2OGJiYzQ2Njk1ZGU0YzZlMDI1
NmEzNTgwY2NiYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmJiMGQ4Y2JiM2VhZTJl
NWVjY2M1OWYxNmZmZjc2ZDU5MTc3MjQxMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjYgTm92
IDIwMjQgMjM6MjM6NDIgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXV0b2dlbi5zaDogcmVtb3Zl
ICctdW5rbm93bicgaW4gdmVyc2lvbgpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2F1dG9nZW4uc2gg
Yi9hdXRvZ2VuLnNoCi1pbmRleCA5ZjkxMjk3Li45Zjc1NTliIDEwMDc1NQoraW5kZXggNzFmODll
Mi4uNmI0MDdlMiAxMDA3NTUKIC0tLSBhL2F1dG9nZW4uc2gKICsrKyBiL2F1dG9nZW4uc2gKLUBA
IC0yNzEsNyArMjcxLDcgQEAgaWYgWyAiJG15aG9zdCIgPSAiZmluZC12ZXJzaW9uIiBdOyB0aGVu
CitAQCAtMjg2LDcgKzI4Niw3IEBAIGlmIFsgIiRteWhvc3QiID0gImZpbmQtdmVyc2lvbiIgXTsg
dGhlbgogICAgICBlbHNlCiAgICAgICAgaW5naXQ9bm8KICAgICAgICBiZXRhPXllcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRj
aAppbmRleCA2N2I2NTE1N2QxLi40Y2ZlNTNmYWQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNGI0ZTZmYzg5OGRkMjQ5Mzg3YmJlZDQ5MjRmYTIyYzFjNDk0MzI3YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzRjZDA4MmI4ZDZhNzg5M2MwNTQwODVlZjJmYzdhZmE2
NmI5ZjM5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4
dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjEgSnVsIDIwMjUgMTI6NDM6MjkgKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGtnY29uZmlnCkBAIC0yOSwxMCArMjksMTAgQEAgU2lnbmVk
LW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzcmMvZ3BnbWUtcHRocmVhZC5wYy5pbgogCiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBkNGRjYjFjLi4yOTNmY2MyIDEwMDY0NAoraW5k
ZXggYTAxYThjMS4uOGIwZGM0MCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29u
ZmlndXJlLmFjCi1AQCAtODQ0LDYgKzg0NCw3IEBAIEFDX0NPTkZJR19GSUxFUyhNYWtlZmlsZSBz
cmMvTWFrZWZpbGUKK0BAIC04NDUsNiArODQ1LDcgQEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxl
IHNyYy9NYWtlZmlsZQogICAgICAgICAgICAgICAgICBzcmMvZ3BnbWUucGMKICAgICAgICAgICAg
ICAgICAgc3JjL2dwZ21lLWdsaWIucGMKICAgICAgICAgICAgICAgICAgc3JjL2dwZ21lLmgpCkBA
IC00MSw3ICs0MSw3IEBAIGluZGV4IGQ0ZGNiMWMuLjI5M2ZjYzIgMTAwNjQ0CiAgQUNfQ09ORklH
X0ZJTEVTKFtsYW5nL01ha2VmaWxlIGxhbmcvY2wvTWFrZWZpbGUgbGFuZy9jbC9ncGdtZS5hc2Rd
KQogIEFDX0NPTkZJR19GSUxFUyhbbGFuZy9qcy9NYWtlZmlsZSBsYW5nL2pzL3NyYy9NYWtlZmls
ZQogZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXgg
ZWRjMjM5Yi4uZDQyNzA0NCAxMDA2NDQKK2luZGV4IDRmNDVkZmUuLjNjNDkxOTAgMTAwNjQ0CiAt
LS0gYS9zcmMvTWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmlsZS5hbQogQEAgLTIwLDExICsy
MCwxMSBAQApAQCAtMjk1LDYgKzI5NSwzIEBAIGluZGV4IDlkZGVmNWMuLjkzMjY0NWIgMTAwNjQ0
CiArQ2ZsYWdzOiAtSSR7aW5jbHVkZWRpcn0KICtMaWJzOiAtTCR7bGliZGlyfSAtbGdwZ21lCiAg
VVJMOiBodHRwczovL3d3dy5nbnVwZy5vcmcvc29mdHdhcmUvZ3BnbWUvaW5kZXguaHRtbAotLS0g
Ci0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUv
MDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWlu
c3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaAppbmRleCA5MzJmYjljOTYyLi5hMmM3NTdkNGVmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMt
VXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2Zm
NjRfdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDE3MDM2MDUxYzg0YjAyZmU0M2YxNjJl
ZTM3ODI3OGE0NDYzNjQ1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGUyN2RmZjM3
ODQwMzlhZjY4YzUzNzk4MWM3OGQ1ZjhiNWMyM2NlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IERlYyAy
MDIyIDA4OjQ0OjEzIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBvc2l4LWlvLmM6IFVzZSBvZmZf
dCBpbnN0ZWFkIG9mIG9mZjY0X3QKQEAgLTI2LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3Bvc2l4LWlvLmMgYi9zcmMv
cG9zaXgtaW8uYwotaW5kZXggMGQwYTk4Yi4uMjg2YTYyNiAxMDA2NDQKK2luZGV4IDRkZWU3NzYu
LjNiOTk1MDAgMTAwNjQ0CiAtLS0gYS9zcmMvcG9zaXgtaW8uYwogKysrIGIvc3JjL3Bvc2l4LWlv
LmMKIEBAIC03NCw4ICs3NCw4IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
cGdtZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20t
b24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2gKaW5kZXggZWQyZWRhYmQ2My4uMGNkYzRlOTFh
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11c2Ut
Y2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xp
YmMtMi4zNC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWFlZDAzYjc2NTA1YjFmZWFlZWI1
YTRhM2M2YmRjYzdkZDA4OWYwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmI2ZDM1
NTIzZWYxYjZkOWM3OTQwMTgyZWY0OWUxMTE5NTlmMDQxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IEp1
bCAyMDIxIDEyOjMzOjEzIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVzZSBjbG9zZWZyb20oKSBv
biBsaW51eCBhbmQgZ2xpYmMgMi4zNCsKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3Bvc2l4LWlvLmMg
Yi9zcmMvcG9zaXgtaW8uYwotaW5kZXggYTQyMmQ4Zi4uMGQwYTk4YiAxMDA2NDQKK2luZGV4IGY4
MTk2ZjkuLjRkZWU3NzYgMTAwNjQ0CiAtLS0gYS9zcmMvcG9zaXgtaW8uYwogKysrIGIvc3JjL3Bv
c2l4LWlvLmMKLUBAIC01NzcsNyArNTc3LDcgQEAgX2dwZ21lX2lvX3NwYXduIChjb25zdCBjaGFy
ICpwYXRoLCBjaGFyICpjb25zdCBhcmd2W10sIHVuc2lnbmVkIGludCBmbGFncywKK0BAIC01OTks
NyArNTk5LDcgQEAgX2dwZ21lX2lvX3NwYXduIChjb25zdCBjaGFyICpwYXRoLCBjaGFyICpjb25z
dCBhcmd2W10sIHVuc2lnbmVkIGludCBmbGFncywKICAgICAgICAgICAgICAgIGlmIChmZF9saXN0
W2ldLmZkID4gZmQpCiAgICAgICAgICAgICAgICAgIGZkID0gZmRfbGlzdFtpXS5mZDsKICAgICAg
ICAgICAgICBmZCsrOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3Bn
bWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMt
aW4tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1j
b25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoCmluZGV4
IGMwMjFlNDhiZTkuLmQ2NDQ1ZDRkNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dwZ21lL2dwZ21lLzAwMDUtZ3BnbWUtY29uZmlnLXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRp
cmVjdG9yaWVzLWluLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZS8wMDA1LWdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1p
bi0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDllYTY4NWYxYjg5OGVlNzAzYjg1YjcwNWMz
NWI5Y2JkNzdjY2ExN2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk1MDY1MWIzMjI2
MjQwZWYzNDUzMjcwZmRjYTQyMTNkNmU0MmM1MmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRo
dSwgMTMgQXByIDIwMTcgMTY6NDA6MjcgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ3BnbWUtY29u
ZmlnOiBza2lwIGFsbCAvbGliKiBvciAvdXNyL2xpYiogZGlyZWN0b3JpZXMgaW4KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMC4xLmJiIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4wLjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4wLmJiCmluZGV4IGFlMjBm
Nzg1ZTYuLjI2OTA3MGIxMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lXzIuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIu
MS4wLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2dwZ21l
LyR7QlB9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdXRvZ2VuLnNoLXJlbW92
ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI4MjFhYjA2OTVjODQyZWFiNTE3NTJhODE5ODBjOTJiMDQxMGM3ZWFkZDA0MTAz
Zjc5MWQ1ZDJhNTI2Nzg0OTY2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0MWM1ZWE1M2ZjMjYy
NTlmNGZiZjBlOGJkZTk4MmRlYTFiOGExY2EwY2I3N2U2ODFjODJiMDUwNTY2YmY5MmIiCiAKIERF
UEVORFMgPSAibGliZ3BnLWVycm9yLW5hdGl2ZSBsaWJncGctZXJyb3IgbGliYXNzdWFuIgogCi0t
IAoyLjQ3LjEKCg==

--===============4228414947638171493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.0.1", added "/usr/lib/libgpgme.so.45.1.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.0.1 to libgpgme.so.45.1.0
  /usr/lib/libgpgme.so.45.0.1 moved to /usr/lib/libgpgme.so.45.1.0

--===============4228414947638171493==--

