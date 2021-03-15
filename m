Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.328.1615826521152834421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4796538C128A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.1 SUCCEEDED
Message-ID: <MADEUP.166C91A954319288.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149526
Content-Type: multipart/mixed; boundary="===============6721601564517542295=="

--===============6721601564517542295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.0-3.7.1.patch
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

--===============6721601564517542295==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.0-3.7.1.patch"

From 2eff972f828ace6f7c90036fe9d07a435f486a0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 15:30:13 +0000
Subject: [PATCH] gnutls: upgrade 3.7.0 -> 3.7.1

---
 .../recipes-support/gnutls/{gnutls_3.7.0.bb => gnutls_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.0.bb => gnutls_3.7.1.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.0.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.0.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 1aa94ece3a..51d472c828 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "49e2a22691d252c9f24a9829b293a8f359095bc5a818351f05f1c0a5188a1df8"
+SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1


--===============6721601564517542295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 10114568 to 10124900 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 568366 to 568423 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4307771 to 4308680 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGSIZE changed from 18136 to 19230 (+6%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGSIZE changed from 111991 to 107895 (-4%)
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 9169240 to 9185832 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.0" to "3.7.1"
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.0.tar.xz file://arm_eabi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.1.tar.xz file://arm_eabi.patch"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.0 [default] to 3.7.1 [default]
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.29.0 to libgnutls.so.30.29.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.29.0 to libgnutls.so.30.29.1
  /usr/lib/libgnutls.so.30.29.0 moved to /usr/lib/libgnutls.so.30.29.1

--===============6721601564517542295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.29.0 to libgnutls.so.30.29.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.29.0 to libgnutls.so.30.29.1
  /usr/lib/libgnutls.so.30.29.0 moved to /usr/lib/libgnutls.so.30.29.1

--===============6721601564517542295==--
