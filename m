Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.1305.1618510599615473954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 344BC38C13C8
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acl: upgrading to 2.3.1 SUCCEEDED
Message-ID: <MADEUP.16761AD1B296E198.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150581
Content-Type: multipart/mixed; boundary="===============8957451489799298550=="

--===============8957451489799298550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acl* to *2.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acl-upgrade-2.2.53-2.3.1.patch
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

--===============8957451489799298550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/acl/acl-locale-de: PKGSIZE changed from 6803 to 8722 (+28%)
Changes to packages/core2-32-poky-linux/acl (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so.1.1.2253 moved to /usr/lib/libacl.so.1.1.2301
Changes to packages/x86_64-linux/acl-native (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so.1.1.2253 moved to /usr/lib/libacl.so.1.1.2301

--===============8957451489799298550==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-acl-upgrade-2.2.53-2.3.1.patch"

From e282d113f627d05aaf8388d9b9bf4e8bf4c5b1bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 16:43:46 +0000
Subject: [PATCH] acl: upgrade 2.2.53 -> 2.3.1

---
 meta/recipes-support/attr/{acl_2.2.53.bb => acl_2.3.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/attr/{acl_2.2.53.bb => acl_2.3.1.bb} (94%)

diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.3.1.bb
similarity index 94%
rename from meta/recipes-support/attr/acl_2.2.53.bb
rename to meta/recipes-support/attr/acl_2.3.1.bb
index 7cee45948d..7f6cbf5c43 100644
--- a/meta/recipes-support/attr/acl_2.2.53.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -21,8 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://0001-test-patch-out-failing-bits.patch \
            "
 
-SRC_URI[md5sum] = "007aabf1dbb550bcddde52a244cd1070"
-SRC_URI[sha256sum] = "06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7"
+SRC_URI[sha256sum] = "760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af"
 
 inherit autotools gettext ptest
 
-- 
2.27.0


--===============8957451489799298550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acl/acl-dbg: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-dbg: PKGSIZE changed from 297356 to 296780 (-0%)
packages/core2-32-poky-linux/acl/acl-dbg: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-dev: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-dev: PKGSIZE changed from 6533 to 6532 (-0%)
packages/core2-32-poky-linux/acl/acl-dev: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-doc: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-doc: PKGSIZE changed from 224926 to 225254 (+0%)
packages/core2-32-poky-linux/acl/acl-doc: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-de: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-de: PKGSIZE changed from 6803 to 8722 (+28%)
packages/core2-32-poky-linux/acl/acl-locale-de: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-en+boldquot: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-en+boldquot: PKGSIZE changed from 8499 to 8581 (+1%)
packages/core2-32-poky-linux/acl/acl-locale-en+boldquot: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-en+quot: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-en+quot: PKGSIZE changed from 8415 to 8497 (+1%)
packages/core2-32-poky-linux/acl/acl-locale-en+quot: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-es: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-es: PKGSIZE changed from 7013 to 6972 (-1%)
packages/core2-32-poky-linux/acl/acl-locale-es: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-fr: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-fr: PKGSIZE changed from 6718 to 6677 (-1%)
packages/core2-32-poky-linux/acl/acl-locale-fr: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-gl: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-gl: PKGSIZE changed from 7011 to 6970 (-1%)
packages/core2-32-poky-linux/acl/acl-locale-gl: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-pl: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-pl: PKGSIZE changed from 7045 to 7004 (-1%)
packages/core2-32-poky-linux/acl/acl-locale-pl: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-locale-sv: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-locale-sv: PKGSIZE changed from 6653 to 6612 (-1%)
packages/core2-32-poky-linux/acl/acl-locale-sv: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-ptest: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-ptest: PKGSIZE changed from 775130 to 775146 (+0%)
packages/core2-32-poky-linux/acl/acl-ptest: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-src: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-src: PKGSIZE changed from 205672 to 206897 (+1%)
packages/core2-32-poky-linux/acl/acl-src: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl-staticdev: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl-staticdev: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl/acl: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/acl: PKGSIZE changed from 78756 to 78612 (-0%)
packages/core2-32-poky-linux/acl/acl: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl: PV changed from "2.2.53" to "2.3.1"
packages/core2-32-poky-linux/acl: SRC_URI changed from "https://download.savannah.gnu.org/releases/acl/acl-2.2.53.tar.gz file://run-ptest file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch file://0001-test-patch-out-failing-bits.patch" to "https://download.savannah.gnu.org/releases/acl/acl-2.3.1.tar.gz file://run-ptest file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch file://0001-test-patch-out-failing-bits.patch"
packages/core2-32-poky-linux/acl/libacl: PKGV changed from 2.2.53 [default] to 2.3.1 [default]
packages/core2-32-poky-linux/acl/libacl: PKGSIZE changed from 42434 to 42342 (-0%)
packages/core2-32-poky-linux/acl/libacl: PV changed from "2.2.53" to "2.3.1"
Changes to packages/core2-32-poky-linux/acl (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so.1.1.2253 moved to /usr/lib/libacl.so.1.1.2301
Changes to packages/x86_64-linux/acl-native (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2253 to libacl.so.1.1.2301
  /usr/lib/libacl.so.1.1.2253 moved to /usr/lib/libacl.so.1.1.2301

--===============8957451489799298550==--
