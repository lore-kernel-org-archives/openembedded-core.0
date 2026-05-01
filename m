Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D93FCD4847
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15627.1777645547084213696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dYmYTFuC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cnbAgZTw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee9220-da6b2376-6a49-494b-8df6-e592b77aa2ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JxICck5pyxQ0b+k5wuwdNViS5VJboG7I28r+Y1nzN40=;
	b=dYmYTFuCh1iOnVtFX1GoDunzsdqVJ7jRxbaJ4gyJJo3NIEJiWl/cVBNgLq0tT7Q6
	XFH2LuzHYT7aqpOxvSdmq0kR+zwCpD52qnhlEIrXLrH33QVBlCKfbYzLBrDjc646iCW
	5zAKn97KrKdiziM2eQ6+3vGxZjSatJiciQE9oZfA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JxICck5pyxQ0b+k5wuwdNViS5VJboG7I28r+Y1nzN40=;
	b=cnbAgZTwnML/6pIvXXqZSrtH1yhMTOzNwS9lXAeKZt4tK1F4TZdHGRq7fLZO0PO2
	4vZHln/AXVxa4pr2JNciyb1w60KIrHbkF81nN2ObbIBdu19VhY4Chwji8lhC/L60V4c
	UVOiSYDIegh/Cgu4qNd4y0tTw5zGtuEi/YbNAStY=
Content-Type: multipart/mixed; boundary="===============5294209201214737142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.60 SUCCEEDED
Message-ID: <0101019de3ee9220-da6b2376-6a49-494b-8df6-e592b77aa2ae-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236297

--===============5294209201214737142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.59-1.60.patch
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
From dc25c0d69eb30556c3c81ca4c4ef33a9c28b3eef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:59:09 +0000
Subject: [PATCH] libgpg-error: upgrade 1.59 -> 1.60

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch      | 6 +++---
 .../libgpg-error/libgpg-error/pkgconfig.patch               | 5 +----
 .../{libgpg-error_1.59.bb => libgpg-error_1.60.bb}          | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.59.bb => libgpg-error_1.60.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 39798c009f..3484af63b3 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From b1b6c28b4753c027052aeb6275a73eed06f0bf49 Mon Sep 17 00:00:00 2001
+From 48d457a819d1bf4171c6cc7fe161cdfc66770be2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e56bb23..8c3ba7b 100644
+index 7fd1d98..93a95c8 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -326,6 +326,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -331,6 +331,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 38c55ad342..485c079a2b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From fdc0b6f84bae7cd6eea18712049da62cdfd5e630 Mon Sep 17 00:00:00 2001
+From 3648accd954d86b14f7a4eb72b9ffa4fe57b72d5 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
index 53280f5770..622827c2ca 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "a19bc5087fd97026d93cb4b45d51638d1a25202a5e1fbc3905799f424cfa6134"
+SRC_URI[sha256sum] = "11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.47.1


--===============5294209201214737142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.41.2", added "/usr/lib/libgpg-error.so.0.42.0"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so.0.41.2 moved to /usr/lib/libgpg-error.so.0.42.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so.0.41.2 moved to /usr/lib/libgpg-error.so.0.42.0

--===============5294209201214737142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/libgpg-error: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.59.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.60.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgpg-error: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.41.2", added "/usr/lib/.debug/libgpg-error.so.0.42.0"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1384424 to 1385992 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGSIZE changed from 228955 to 229195 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGSIZE changed from 103890 to 104390 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGSIZE changed from 35330 to 35630 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGSIZE changed from 299981 to 299838 (-0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.59/doc -> /usr/src/debug/libgpg-error/1.60/doc, directory renamed /usr/src/debug/libgpg-error/1.59/tests -> /usr/src/debug/libgpg-error/1.60/tests, directory renamed /usr/src/debug/libgpg-error/1.59/src -> /usr/src/debug/libgpg-error/1.60/src
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 1024661 to 1025216 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.59" to "1.60"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.41.2", added "/usr/lib/libgpg-error.so.0.42.0"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.59 [default] to 1.60 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PV changed from "1.59" to "1.60"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so.0.41.2 moved to /usr/lib/libgpg-error.so.0.42.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.2 to libgpg-error.so.0.42.0
  /usr/lib/libgpg-error.so.0.41.2 moved to /usr/lib/libgpg-error.so.0.42.0

--===============5294209201214737142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.59-1.60.patch"

RnJvbSBkYzI1YzBkNjllYjMwNTU2YzNjODFjYTRjNGVmMzNhOWMyOGIzZWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzo1OTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdwZy1lcnJvcjogdXBncmFkZSAxLjU5IC0+IDEuNjAKCi0tLQogLi4uLzAwMDEtRG8tbm90LWZh
aWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoICAgICAgfCA2ICsrKy0tLQogLi4u
L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoICAgICAgICAgICAgICAg
fCA1ICstLS0tCiAuLi4ve2xpYmdwZy1lcnJvcl8xLjU5LmJiID0+IGxpYmdwZy1lcnJvcl8xLjYw
LmJifSAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci97
bGliZ3BnLWVycm9yXzEuNTkuYmIgPT4gbGliZ3BnLWVycm9yXzEuNjAuYmJ9ICg5NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci8w
MDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvMDAwMS1Eby1ub3QtZmFp
bC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2gKaW5kZXggMzk3OThjMDA5Zi4uMzQ4
NGFmNjNiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xp
YmdwZy1lcnJvci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9y
LzAwMDEtRG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBiMWI2YzI4YjQ3NTNjMDI3MDUyYWViNjI3NWE3M2VlZDA2ZjBiZjQ5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OGQ0NTdhODE5ZDFiZjQxNzFjNmNjN2Zl
MTYxY2RmYzY2NzcwYmUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDI4IEZlYiAyMDIw
IDA5OjE5OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBmYWlsIHdoZW4gdGVzdGlu
ZyBjb25maWcgc2NyaXB0cwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZp
bGUuYW0KLWluZGV4IGU1NmJiMjMuLjhjM2JhN2IgMTAwNjQ0CitpbmRleCA3ZmQxZDk4Li45M2E5
NWM4IDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUuYW0K
LUBAIC0zMjYsNiArMzI2LDUgQEAgZ3BnLWVycm9yLWNvbmZpZzogZ3BncnQtY29uZmlnIGdwZy1l
cnJvci1jb25maWctb2xkIGdwZy1lcnJvci1jb25maWctdGVzdC5zaAorQEAgLTMzMSw2ICszMzEs
NSBAQCBncGctZXJyb3ItY29uZmlnOiBncGdydC1jb25maWcgZ3BnLWVycm9yLWNvbmZpZy1vbGQg
Z3BnLWVycm9yLWNvbmZpZy10ZXN0LnNoCiAgCWVsc2UgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgCSAgZWNobyAibm8iOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgCSAgZWNobyAiKioqICBQbGVhc2UgcmVw
b3J0IHRvIDxodHRwczovL2J1Z3MuZ251cGcub3JnPiB3aXRoIGdwZy1lcnJvci1jb25maWctdGVz
dC5sb2ciOyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3Iv
bGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdw
Zy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCmluZGV4IDM4YzU1YWQzNDIuLjQ4
NWMwNzlhMmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9s
aWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBmZGMwYjZmODRiYWU3Y2Q2ZWVhMTg3MTIwNDlkYTYyY2RmZDVlNjMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAzNjQ4YWNjZDk1NGQ4NmIxNGY3YTRlYjcyYjlmZmE0ZmU1N2I3
MmQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMSBBdWcgMjAyNCAyMDowMzoyOSAtMDcwMAog
U3ViamVjdDogW1BBVENIXSBzdXBwb3J0IHBrZ2NvbmZpZwpAQCAtMjQxLDYgKzI0MSwzIEBAIGlu
ZGV4IDI2M2YyMWIuLmU1NGFiMzggMTAwNjQ0CiAtICBBQ19TVUJTVChHUEdfRVJST1JfTVRfTElC
UykKICBdKQogKwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjU5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjYwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJy
b3JfMS41OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xp
YmdwZy1lcnJvcl8xLjYwLmJiCmluZGV4IDUzMjgwZjU3NzAuLjYyMjgyN2MyY2EgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41OS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yXzEu
NjAuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0vbGliZ3Bn
LWVycm9yL2xpYmdwZy1lcnJvci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL3J1
bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImExOWJjNTA4
N2ZkOTcwMjZkOTNjYjRiNDVkNTE2MzhkMWEyNTIwMmE1ZTFmYmMzOTA1Nzk5ZjQyNGNmYTYxMzQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFiMmE3MzhlMjEyZjNlYWIwZmU4NjM3YmMzNDFkMzE4
MWNhOTY0ZTk3YmIyNjU0ZGU5MWFhYjdkYWU0Y2UwOSIKIAogQklOQ09ORklHID0gIiR7YmluZGly
fS9ncGctZXJyb3ItY29uZmlnIgogCi0tIAoyLjQ3LjEKCg==

--===============5294209201214737142==--

