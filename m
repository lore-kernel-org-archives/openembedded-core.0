Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C364D5E39B
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17420.1765872166883494933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2lZoYG0o;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Bih8OfUZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262ef4f7-3904ebcb-977d-4a28-9ae8-f2d7008b3b70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Td8B7Pywqi9hUp4EWpkQDBJDpBWAp7ZnQD4SS0R3Boc=;
	b=2lZoYG0ofg95v2Me0wN+GSOzuVvBJluRDs3nX3BWYMagUgukXTuLdML1e2MlXoz0
	K6l8yvosRw+TuvBlhlI1EGCnP1TMQ5IZYOncFpLjBQEr0f2HeJCiAzMWBR5AfYJWVzN
	hw7aCoMAAvR3i7VLiSMqS7tfT2kaXfoCc+mORHy4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Td8B7Pywqi9hUp4EWpkQDBJDpBWAp7ZnQD4SS0R3Boc=;
	b=Bih8OfUZUuFWo9vncolB7KZsD1jwGGL7YU8drZggdU7P7Q6NGItcFordGU8/nZ/b
	fUA8f+TVUHvPpLV1RXm3X6+jcYDnWsk/cqktYadVTnzQ+axdQyxYZ8KtsIPAcdEkHHt
	/3HUYHRYAdCPo1/gHdOQHuTZxAqpf0xhuf1dvnzg=
Content-Type: multipart/mixed; boundary="===============2907725944521647849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.58 SUCCEEDED
Message-ID: <0101019b262ef4f7-3904ebcb-977d-4a28-9ae8-f2d7008b3b70-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227921

--===============2907725944521647849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.58* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.56-1.58.patch
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
From c88c23c8415403d871474b0d1ef307148f3bd02b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:29:06 +0000
Subject: [PATCH] libgpg-error: upgrade 1.56 -> 1.58

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch      | 6 +++---
 .../libgpg-error/libgpg-error/pkgconfig.patch               | 5 +----
 .../{libgpg-error_1.56.bb => libgpg-error_1.58.bb}          | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.56.bb => libgpg-error_1.58.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 39798c009f..6ae1f8ba18 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From b1b6c28b4753c027052aeb6275a73eed06f0bf49 Mon Sep 17 00:00:00 2001
+From c013a503450a497360e117a888e7c1e83356c80b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e56bb23..8c3ba7b 100644
+index 82b4193..23b082b 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -326,6 +326,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -331,6 +331,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 38c55ad342..d32a10b08c 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From fdc0b6f84bae7cd6eea18712049da62cdfd5e630 Mon Sep 17 00:00:00 2001
+From 70e6639dc16b9ea49dcfaef3c3bce9eeb6164945 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
@@ -241,6 +241,3 @@ index 263f21b..e54ab38 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
index d3cc88f971..d42a9028e8 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0"
+SRC_URI[sha256sum] = "f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.47.1


--===============2907725944521647849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGSIZE changed from 17166 to 33573 (+96%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.40.0", added "/usr/lib/libgpg-error.so.0.41.1"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so.0.40.0 moved to /usr/lib/libgpg-error.so.0.41.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so.0.40.0 moved to /usr/lib/libgpg-error.so.0.41.1

--===============2907725944521647849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.56.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.58.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgpg-error: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.40.0", added "/usr/lib/.debug/libgpg-error.so.0.41.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1331720 to 1335240 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGSIZE changed from 228155 to 228955 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGSIZE changed from 103772 to 103890 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGSIZE changed from 35174 to 35234 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGSIZE changed from 17166 to 33573 (+96%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGSIZE changed from 300061 to 300246 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.56/doc -> /usr/src/debug/libgpg-error/1.58/doc, directory renamed /usr/src/debug/libgpg-error/1.56/tests -> /usr/src/debug/libgpg-error/1.58/tests, directory renamed /usr/src/debug/libgpg-error/1.56/src -> /usr/src/debug/libgpg-error/1.58/src
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 1019119 to 1024500 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.56" to "1.58"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.40.0", added "/usr/lib/libgpg-error.so.0.41.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.56 [default] to 1.58 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PV changed from "1.56" to "1.58"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so.0.40.0 moved to /usr/lib/libgpg-error.so.0.41.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.40.0 to libgpg-error.so.0.41.1
  /usr/lib/libgpg-error.so.0.40.0 moved to /usr/lib/libgpg-error.so.0.41.1

--===============2907725944521647849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.56-1.58.patch"

RnJvbSBjODhjMjNjODQxNTQwM2Q4NzE0NzRiMGQxZWYzMDcxNDhmM2JkMDJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6Mjk6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJncGctZXJyb3I6IHVwZ3JhZGUgMS41NiAtPiAxLjU4CgotLS0KIC4uLi8wMDAxLURvLW5vdC1m
YWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCAgICAgIHwgNiArKystLS0KIC4u
Li9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaCAgICAgICAgICAgICAg
IHwgNSArLS0tLQogLi4uL3tsaWJncGctZXJyb3JfMS41Ni5iYiA9PiBsaWJncGctZXJyb3JfMS41
OC5iYn0gICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3Iv
e2xpYmdwZy1lcnJvcl8xLjU2LmJiID0+IGxpYmdwZy1lcnJvcl8xLjU4LmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3Iv
MDAwMS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLzAwMDEtRG8tbm90LWZh
aWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoCmluZGV4IDM5Nzk4YzAwOWYuLjZh
ZTFmOGJhMTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9s
aWJncGctZXJyb3IvMDAwMS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJv
ci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYjFiNmMyOGI0NzUzYzAyNzA1MmFlYjYyNzVhNzNlZWQwNmYwYmY0
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzAxM2E1MDM0NTBhNDk3MzYwZTExN2E4
ODhlN2MxZTgzMzU2YzgwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAyOCBGZWIgMjAy
MCAwOToxOTo1NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgZmFpbCB3aGVuIHRlc3Rp
bmcgY29uZmlnIHNjcmlwdHMKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2Vm
aWxlLmFtCi1pbmRleCBlNTZiYjIzLi44YzNiYTdiIDEwMDY0NAoraW5kZXggODJiNDE5My4uMjNi
MDgyYiAxMDA2NDQKIC0tLSBhL3NyYy9NYWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFt
Ci1AQCAtMzI2LDYgKzMyNiw1IEBAIGdwZy1lcnJvci1jb25maWc6IGdwZ3J0LWNvbmZpZyBncGct
ZXJyb3ItY29uZmlnLW9sZCBncGctZXJyb3ItY29uZmlnLXRlc3Quc2gKK0BAIC0zMzEsNiArMzMx
LDUgQEAgZ3BnLWVycm9yLWNvbmZpZzogZ3BncnQtY29uZmlnIGdwZy1lcnJvci1jb25maWctb2xk
IGdwZy1lcnJvci1jb25maWctdGVzdC5zaAogIAllbHNlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogIAkgIGVjaG8gIm5vIjsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogIAkgIGVjaG8gIioqKiAgUGxlYXNlIHJl
cG9ydCB0byA8aHR0cHM6Ly9idWdzLmdudXBnLm9yZz4gd2l0aCBncGctZXJyb3ItY29uZmlnLXRl
c3QubG9nIjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9y
L2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
cGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaAppbmRleCAzOGM1NWFkMzQyLi5k
MzJhMTBiMDhjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3Iv
bGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gZmRjMGI2Zjg0YmFlN2NkNmVlYTE4NzEyMDQ5ZGE2MmNkZmQ1ZTYzMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzBlNjYzOWRjMTZiOWVhNDlkY2ZhZWYzYzNiY2U5ZWViNjE2
NDk0NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjEgQXVnIDIwMjQgMjA6MDM6MjkgLTA3MDAK
IFN1YmplY3Q6IFtQQVRDSF0gc3VwcG9ydCBwa2djb25maWcKQEAgLTI0MSw2ICsyNDEsMyBAQCBp
bmRleCAyNjNmMjFiLi5lNTRhYjM4IDEwMDY0NAogLSAgQUNfU1VCU1QoR1BHX0VSUk9SX01UX0xJ
QlMpCiAgXSkKICsKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41Ni5iYiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVy
cm9yXzEuNTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9s
aWJncGctZXJyb3JfMS41OC5iYgppbmRleCBkM2NjODhmOTcxLi5kNDJhOTAyOGU4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yXzEuNTYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8x
LjU4LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2xpYmdw
Zy1lcnJvci9saWJncGctZXJyb3ItJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MmMzZDJk
ZWI0YWQ5NmFkMzkyNWQ2ZjlmMTI0ZmU3MjA1NzE2MDU1YWI1MGUyOTExMTZlZjI3OTc1ZDE2OWMw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY5NDNhZWE5YTgzMGE4YmQ5MzhlNTEyNGI1NzllZmFl
Y2UyNGEzMjI1ZmY0YzNkMjc2MTFhODBjZTEyNjBjMjciCiAKIEJJTkNPTkZJRyA9ICIke2JpbmRp
cn0vZ3BnLWVycm9yLWNvbmZpZyIKIAotLSAKMi40Ny4xCgo=

--===============2907725944521647849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1c7894784097bf73cdf86e0953965a0f66049fcd"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:1c7894784097bf73cdf86e0953965a0f66049fcd"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 259 Local 163 Mirrors 0 Missed 96 Current 255 (62% match, 81% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 392 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 396 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 401 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 416 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 420 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 423 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 425 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 448 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 450 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 475 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 810 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 838 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 839 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 873 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_fetch)
NOTE: Running task 875 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 906 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 907 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_fetch)
NOTE: Running task 908 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 909 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_fetch)
NOTE: Running task 910 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_fetch)
NOTE: Running task 911 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: Running setscene task 479 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Started
NOTE: recipe libcap-2.77-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: Running task 913 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 914 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: Running task 916 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: Running task 917 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libcap-2.77-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_unpack)
NOTE: Running task 921 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 922 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_fetch: Succeeded
NOTE: Running task 927 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_fetch)
NOTE: Running task 928 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 929 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_fetch)
NOTE: Running task 930 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: Running task 934 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe coreutils-9.9-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 938 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_unpack)
NOTE: recipe coreutils-9.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 482 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 939 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 483 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 940 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 941 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe util-linux-2.41.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 484 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running setscene task 486 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 942 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe libcap-2.77-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 943 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 945 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 947 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 948 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_unpack: Succeeded
NOTE: Running setscene task 488 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 949 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 491 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_unpack: Started
NOTE: Running task 953 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 955 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 957 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 959 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: Running task 962 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 963 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.77-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Succeeded
NOTE: Running task 964 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 965 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe libcap-2.77-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 970 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 973 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 974 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: Running task 975 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: Running task 977 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 495 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 982 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 983 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_deploy_source_date_epoch unihash changed to 31fc63eacf0bb87d0f014354ae340c02ff54c6558b356872b5c0a80d26e70813
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 984 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: Running task 986 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: Running task 990 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_patch: Started
NOTE: Running task 998 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running noexec task 1000 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1001 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_unpack: Started
NOTE: Running task 1008 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1040 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running setscene task 497 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 498 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 499 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: Running task 1042 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1043 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1044 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe util-linux-2.41.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1046 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 1048 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1091 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_lic)
NOTE: Running task 1092 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1093 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.41.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: Running task 1096 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 500 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_unpack: Succeeded
NOTE: Running task 1098 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1100 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running task 1101 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.58-r0: task do_populate_lic: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_lic unihash changed to dac31775ecc700ddcb6f41d4a83dbf6841fec480a2749a326aeda99aef3521d7
NOTE: Running setscene task 505 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1113 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: Running task 1115 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 1119 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1145 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1172 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 1174 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Succeeded
NOTE: Running task 1175 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1177 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: Running task 1179 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 1181 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1182 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1187 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1188 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Succeeded
NOTE: Running task 1190 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Succeeded
NOTE: Running task 1191 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1192 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Setscene tasks completed
NOTE: Running task 1193 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to ba3093ce4aaa1925a3c23abc9c31dbb5d71261919739d6dfcf89d75c863e99e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 508 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1196 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1197 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.5+git-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_install: Succeeded
NOTE: Running task 1199 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1200 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Started
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1201 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to 06c8996125a77b74e4639ad4db3f7cb2187de024ef8abf0fdad1fb712b0a1311
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Running setscene task 508 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1205 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1206 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1207 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1208 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1210 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1211 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1212 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_configure)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package unihash changed to 17f6d81c27c034626dbfe37ad98d0d46bcbedf1abe70eaea1a6853ce7e272d08
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx became valid
NOTE: Running setscene task 506 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1215 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1216 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1217 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1225 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1226 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1227 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package)
NOTE: Running task 1228 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1230 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1231 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1232 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1233 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1235 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1236 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1237 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1238 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1239 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_configure: Started
NOTE: Running task 1240 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1242 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_configure)
NOTE: Running task 1243 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: Running task 1244 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_configure)
NOTE: Running task 1245 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: Running task 1247 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1249 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1250 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: Running task 1252 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1253 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1254 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1255 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1256 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1257 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1258 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: Running task 1259 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1261 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1262 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1263 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1265 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_compile)
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: Running task 1266 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1267 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: Running task 1268 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1269 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1276 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_install)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1277 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1278 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package unihash changed to 80aac9b3e870811fef28604e07005add13f3876f81b2219185ffe23ba7b06680
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Running setscene task 470 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1279 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: Running task 1280 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1282 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1283 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_configure: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1286 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: Running task 1288 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package)
NOTE: Running task 1291 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libcap-2.77-r0: task do_configure: Succeeded
NOTE: Running task 1292 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1293 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1294 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1295 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1296 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1297 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1299 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_collect_spdx_deps)
NOTE: Setscene tasks completed
NOTE: Running task 1300 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1301 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1302 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: Running task 1303 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to f12e6abe990801ab8563841fbdfd72f7a299900292cd468a8fee69ac8fba03a8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Succeeded
NOTE: Running task 1304 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package unihash changed to 0e68455691b0e968c970f8872ab9e260d2a301eb1a42d7dc4140fb5373bc2a8e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx became valid
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1307 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_collect_spdx_deps)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1308 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 7269b98ef955f57520476f9cc61dd44b4f60053d29ce40d06822103726cafcc0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1310 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1313 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1314 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1315 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: Running task 1317 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1319 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_collect_spdx_deps)
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1320 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1321 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1322 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-2.77-r0: task do_install: Succeeded
NOTE: Running task 1325 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1326 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 4b2660ae4de179b52eb9271829205fa7f71c412205fa06556d003b77a08459dd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running task 1328 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1329 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1332 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure_ptest_base)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1334 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package)
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1335 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile)
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1336 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1338 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1339 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 5060cb7d48913e567c39220d1dc985ce237fa378ee56707c96320496710a0aa0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: recipe perl-5.40.2-r0: task do_configure: Started
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 25d80fabeb97f86a74ffa8024d37f3be171c7678fd806505241481f6b9e55fdb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb became valid
NOTE: Running setscene task 503 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 504 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 506 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to f0b472ed0c2e7db9310634e3674422e44eb73ffa81f65ac3170b72652251b383
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Running setscene task 509 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package unihash changed to efc156f4db81f87b6938e052fe63944adf18d183f04828655024a5007343d54f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/bash-completion/2.16.0/temp/log.do_packagedata_setscene.4047697
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 1349 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata)
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to 5462276eba73fb0f8617697ec58750c4ab8e8e18c6d121b964a398c8178d45e5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: Running setscene task 509 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1351 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running task 1353 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-2.77-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1357 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Succeeded
NOTE: Running task 1358 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1359 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install)
NOTE: recipe libgpg-error-1.58-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1360 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1362 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1364 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe libcap-2.77-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_package unihash changed to 2b1b8707ac9ce18c0c1a7a298de5c962b6aa8900b137e1d4bbed5ff1255ba8a1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata became valid
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running task 1365 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package)
NOTE: Running task 1366 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_sysroot)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package: Started
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_sysroot unihash changed to f6a647b1f841ae3d6676271906852e0f403026fb32ff63eb4271e7845e1dbace
NOTE: Setscene tasks completed
NOTE: Running task 1368 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1371 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_compile: Succeeded
NOTE: Running task 1372 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1373 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1374 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_install: Succeeded
NOTE: Running task 1376 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1377 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_compile)
NOTE: recipe shadow-4.18.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package unihash changed to bc72a2bab314895e5b2dc01484aab53e9d1c152ca17d790e137dfafa88168eca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1379 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.58-r0: task do_create_spdx: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 1e81b25998292ce6d109efb3d2dc35f85de0760f68e87b4b36aaca728e451cc5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1380 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_create_spdx: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1382 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1383 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_package unihash changed to d36a414efcff72e10c6f4e7403a48b87271568f94db8e76690788751c128aeab
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1388 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1389 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_install)
NOTE: recipe coreutils-9.9-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1390 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package)
NOTE: Running task 1393 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1394 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1395 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 542864a6f5f4f8f274a43711e6cc735abe8e1853bf8b70dc3ba4ddee2cc752de
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1396 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to c6ef7b87988325dcba36bcfd72c7880566eabdbb973b693b4183eaabeedc2857
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.18.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package unihash changed to 1a3dc4fb49144ac8192111bdcc38d9ce394f4ffffbe5d49046a6e90162f5ede7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1403 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to ee00b83250b3feebcd3f40384ef7690e62cabec9a92bca32d5b9f18298dff8bb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx became valid
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1408 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1410 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1411 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: Running task 1412 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1413 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_install)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_install: Succeeded
NOTE: Running task 1415 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_package)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_package: Started
NOTE: recipe util-linux-2.41.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1417 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_configure)
NOTE: recipe util-linux-2.41.2-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_package unihash changed to fad3f3601fbb0d9bc245cb5b66797bbbd9c9a92dfd1722a54a17578c42181c9b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata became valid
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1419 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1420 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile)
NOTE: recipe perl-5.40.2-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 23d66dc8c5916ac94c92c46bf30562e1b192692869e62aa0b90e7e5cbb86bc38
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: recipe coreutils-9.9-r0: task do_configure: Succeeded
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running task 1421 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running task 1422 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1425 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1427 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1428 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe coreutils-9.9-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1431 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1432 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install)
NOTE: recipe coreutils-9.9-r0: task do_install: Started
NOTE: recipe coreutils-9.9-r0: task do_install: Succeeded
NOTE: Running task 1433 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 139bfcaf2f711dd3d288321130826b4c82778131012f52c34f073acfbfeb461e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 512 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1437 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: Running task 1438 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 18d39f0e52b4462bae0eeafb9bdbd37adc63488ae2690e81613b7f1460e8458b
NOTE: recipe util-linux-2.41.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1441 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.41.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.41.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1442 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_compile)
NOTE: recipe util-linux-2.41.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1443 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package)
NOTE: Running task 1444 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1445 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe util-linux-2.41.2-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.41.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to d353006a04accb04271481f9bf819f2fce8f69611a6672c097f566a6df90dd9b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_ipk became valid
NOTE: Running setscene task 504 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 510 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running task 1448 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1451 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_create_package_spdx)
NOTE: Running task 1455 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_qa)
NOTE: recipe libgpg-error-1.58-r0: task do_create_package_spdx: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package_qa: Started
NOTE: recipe libgpg-error-1.58-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package_qa unihash changed to 3e72b6e0d0370b1e378872f3c4439bf5d45270aaf6ae650f83a617fb6d26cf03
NOTE: recipe util-linux-2.41.2-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.41.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1457 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_package)
NOTE: recipe util-linux-2.41.2-r0: task do_package: Started
NOTE: recipe coreutils-9.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package unihash changed to 24370c745a46fe0a4a23839fc0cb6bba60ee5e6fdcb93520e639740b974315f4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.41.2-r0: task do_package: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_package unihash changed to db0f65da9b4b4015bb9d31070cd35f109d14d07da7e34bc79e523be386eec5ba
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_packagedata became valid
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_packagedata_setscene)
NOTE: Running task 1459 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1460 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_install: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.40.2-r0: task do_install: Succeeded
NOTE: Running task 1462 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1463 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package unihash changed to f63e45a29a5af25c823c8d410318a12ec6271fcdfd072d9059a7924c790d973a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 510 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 511 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 512 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 513 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 514 of 514 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 1469 of 1469 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_build)
NOTE: Tasks Summary: Attempted 1469 tasks of which 1175 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-src went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dbg went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-extra went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-staticdev went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dev went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-doc went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-locale went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2907725944521647849==--

