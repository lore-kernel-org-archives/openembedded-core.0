Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5218.1613463848513890660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id E8D0C38C1292
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.9.4 SUCCEEDED
Message-ID: <MADEUP.16642CD2F9D71DE1.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148126
Content-Type: multipart/mixed; boundary="===============1968534670631988922=="

--===============1968534670631988922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-db* to *2.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-db-upgrade-2.9.3-2.9.4.patch
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

--===============1968534670631988922==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-man-db-upgrade-2.9.3-2.9.4.patch"

From e01e87cc8ec94d94ab4ba7daf34fa273c1ac99d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 22:59:13 +0000
Subject: [PATCH] man-db: upgrade 2.9.3 -> 2.9.4

---
 .../man-db/{man-db_2.9.3.bb => man-db_2.9.4.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.9.3.bb => man-db_2.9.4.bb} (95%)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.3.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
similarity index 95%
rename from meta/recipes-extended/man-db/man-db_2.9.3.bb
rename to meta/recipes-extended/man-db/man-db_2.9.4.bb
index e8da92bd19..997cbe7e51 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c5597b8"
+SRC_URI[sha256sum] = "b66c99edfad16ad928c889f87cf76380263c1609323c280b3a9e6963fdb16756"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
@@ -23,7 +23,6 @@ EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
 # Can be dropped when the output next changes, avoids failures after
 # reproducibility issues
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
 
 do_install() {
-- 
2.17.1


--===============1968534670631988922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-db/man-db-locale-ro: PKGSIZE changed from 9646 to 22597 (+134%)
Changes to packages/core2-32-poky-linux/man-db (sysroot):
  /usr/lib/man-db/libmandb.so changed symlink target from libmandb-2.9.3.so to libmandb-2.9.4.so
  /usr/lib/man-db/libman.so changed symlink target from libman-2.9.3.so to libman-2.9.4.so
  /usr/lib/man-db/libman-2.9.3.so moved to /usr/lib/man-db/libman-2.9.4.so
  /usr/lib/man-db/libmandb-2.9.3.so moved to /usr/lib/man-db/libmandb-2.9.4.so

--===============1968534670631988922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-db: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db: SRC_URI changed from "https://download.savannah.nongnu.org/releases/man-db/man-db-2.9.3.tar.xz file://99_mandb file://man_db.conf-avoid-multilib-install-file-conflict.patch" to "https://download.savannah.nongnu.org/releases/man-db/man-db-2.9.4.tar.xz file://99_mandb file://man_db.conf-avoid-multilib-install-file-conflict.patch"
packages/core2-32-poky-linux/man-db: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-dbg: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-dbg: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-dbg: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-dbg: PKGSIZE changed from 2206040 to 2207220 (+0%)
packages/core2-32-poky-linux/man-db/man-db-dbg: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-dev: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-dev: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-dev: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-dev: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-doc: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-doc: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-doc: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-doc: PKGSIZE changed from 338398 to 338389 (-0%)
packages/core2-32-poky-linux/man-db/man-db-doc: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-af: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-af: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-af: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-af: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-be: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-be: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-be: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-be: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-da: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-da: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-da: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-da: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-de: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-de: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-de: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-de: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-el: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-el: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-el: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-el: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-es: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-es: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-es: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-es: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-et: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-et: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-et: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-et: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-id: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-id: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-id: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-id: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-it: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-it: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-it: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-it: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PKGSIZE changed from 9646 to 22597 (+134%)
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-src: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-src: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-src: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-src: PKGSIZE changed from 2380132 to 2380150 (+0%)
packages/core2-32-poky-linux/man-db/man-db-src: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db-staticdev: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db-staticdev: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db-staticdev: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db-staticdev: PV changed from "2.9.3" to "2.9.4"
packages/core2-32-poky-linux/man-db/man-db: PKGR changed from r1 [default] to r0 [default]
packages/core2-32-poky-linux/man-db/man-db: PR changed from "r1" to "r0"
packages/core2-32-poky-linux/man-db/man-db: PKGV changed from 2.9.3 [default] to 2.9.4 [default]
packages/core2-32-poky-linux/man-db/man-db: PV changed from "2.9.3" to "2.9.4"
Changes to packages/core2-32-poky-linux/man-db (sysroot):
  /usr/lib/man-db/libmandb.so changed symlink target from libmandb-2.9.3.so to libmandb-2.9.4.so
  /usr/lib/man-db/libman.so changed symlink target from libman-2.9.3.so to libman-2.9.4.so
  /usr/lib/man-db/libman-2.9.3.so moved to /usr/lib/man-db/libman-2.9.4.so
  /usr/lib/man-db/libmandb-2.9.3.so moved to /usr/lib/man-db/libmandb-2.9.4.so

--===============1968534670631988922==--
