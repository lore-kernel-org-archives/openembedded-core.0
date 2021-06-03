Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2062.1622683489765158168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id A7DBF38C1106
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:49 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.2 SUCCEEDED
Message-ID: <MADEUP.1684EE09658A8DFB.31310@lists.openembedded.org>
X-Groupsio-MsgNum: 152587
Content-Type: multipart/mixed; boundary="===============2200639496907829330=="

--===============2200639496907829330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.1-3.7.2.patch
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

--===============2200639496907829330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGSIZE changed from 1321888 to 1297312 (-2%)
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 9160052 to 9128460 (-0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 568423 to 568817 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4308680 to 4356110 (+1%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGSIZE changed from 19230 to 19867 (+3%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 9185832 to 9179710 (-0%)
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls/gnutls: PKGSIZE changed from 2174092 to 2178188 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.1.tar.xz file://arm_eabi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz file://arm_eabi.patch"
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.29.1 to libgnutls.so.30.30.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.29.1 to libgnutls.so.30.30.0
  /usr/lib/libgnutls.so.30.29.1 moved to /usr/lib/libgnutls.so.30.30.0
packages/core2-32-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 366984 to 367024 (+0%)

--===============2200639496907829330==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.1-3.7.2.patch"

From 3eb879eb54292d90dbd0d58a1f9902b87dcb0129 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 3 Jun 2021 00:57:22 +0000
Subject: [PATCH] gnutls: upgrade 3.7.1 -> 3.7.2

---
 .../recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.2.bb
index 350d0a018b..430d1f2d7d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f"
+SRC_URI[sha256sum] = "646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1


--===============2200639496907829330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.29.1 to libgnutls.so.30.30.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.29.1 to libgnutls.so.30.30.0
  /usr/lib/libgnutls.so.30.29.1 moved to /usr/lib/libgnutls.so.30.30.0

--===============2200639496907829330==--
