Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4689.1621074783278780536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2C45538C1262
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.15 SUCCEEDED
Message-ID: <MADEUP.167F36ED3BA3698B.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151778
Content-Type: multipart/mixed; boundary="===============3823645260620502542=="

--===============3823645260620502542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.16.13-9.16.15.patch
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

--===============3823645260620502542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.16.13.so to libbind9-9.16.15.so
  /usr/lib/libdns.so changed symlink target from libdns-9.16.13.so to libdns-9.16.15.so
  /usr/lib/libirs.so changed symlink target from libirs-9.16.13.so to libirs-9.16.15.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.16.13.so to libisccc-9.16.15.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.16.13.so to libisccfg-9.16.15.so
  /usr/lib/libisc.so changed symlink target from libisc-9.16.13.so to libisc-9.16.15.so
  /usr/lib/libns.so changed symlink target from libns-9.16.13.so to libns-9.16.15.so
  /usr/lib/libbind9-9.16.13.so moved to /usr/lib/libbind9-9.16.15.so
  /usr/lib/libdns-9.16.13.so moved to /usr/lib/libdns-9.16.15.so
  /usr/lib/libirs-9.16.13.so moved to /usr/lib/libirs-9.16.15.so
  /usr/lib/libisc-9.16.13.so moved to /usr/lib/libisc-9.16.15.so
  /usr/lib/libisccc-9.16.13.so moved to /usr/lib/libisccc-9.16.15.so
  /usr/lib/libisccfg-9.16.13.so moved to /usr/lib/libisccfg-9.16.15.so
  /usr/lib/libns-9.16.13.so moved to /usr/lib/libns-9.16.15.so

--===============3823645260620502542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.16.13-9.16.15.patch"

From 5d8545fe226de74be9ad1a767b176104c28a3262 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 03:02:51 +0000
Subject: [PATCH] bind: upgrade 9.16.13 -> 9.16.15

---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/bind9                   | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/conf.patch              | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/named.service           | 0
 .../bind/{bind_9.16.13.bb => bind_9.16.15.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.13.bb => bind_9.16.15.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/bind9 b/meta/recipes-connectivity/bind/bind-9.16.15/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.15/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/named.service b/meta/recipes-connectivity/bind/bind-9.16.15/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.15/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.13.bb b/meta/recipes-connectivity/bind/bind_9.16.15.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.13.bb
rename to meta/recipes-connectivity/bind/bind_9.16.15.bb
index 38825f1cf7..25c4f2524a 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.15.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a54cc793fa5b69b35f610f2095760f8238dff5cfd52419f7ee1c9c227da4cc08"
+SRC_URI[sha256sum] = "98b6f432d878a7bf8f57eb7b3c28be27278cf6b9989154bfe6c81104b38e7839"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.27.0


--===============3823645260620502542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10490828 to 10484384 (-0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1602962 to 1603372 (+0%)
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 300077 to 300094 (+0%)
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.16.13.so", added "/usr/lib/*-9.16.15.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 3934892 to 3930796 (-0%)
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9799468 to 9805356 (+0%)
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind/bind-utils: PKGSIZE changed from 475236 to 483428 (+2%)
packages/core2-32-poky-linux/bind/bind: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.16.13/bind-9.16.13.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.16.15/bind-9.16.15.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PV changed from "9.16.13" to "9.16.15"
packages/core2-32-poky-linux/bind: PKGV changed from 9.16.13 [default] to 9.16.15 [default]
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.16.13.so to libbind9-9.16.15.so
  /usr/lib/libdns.so changed symlink target from libdns-9.16.13.so to libdns-9.16.15.so
  /usr/lib/libirs.so changed symlink target from libirs-9.16.13.so to libirs-9.16.15.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.16.13.so to libisccc-9.16.15.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.16.13.so to libisccfg-9.16.15.so
  /usr/lib/libisc.so changed symlink target from libisc-9.16.13.so to libisc-9.16.15.so
  /usr/lib/libns.so changed symlink target from libns-9.16.13.so to libns-9.16.15.so
  /usr/lib/libbind9-9.16.13.so moved to /usr/lib/libbind9-9.16.15.so
  /usr/lib/libdns-9.16.13.so moved to /usr/lib/libdns-9.16.15.so
  /usr/lib/libirs-9.16.13.so moved to /usr/lib/libirs-9.16.15.so
  /usr/lib/libisc-9.16.13.so moved to /usr/lib/libisc-9.16.15.so
  /usr/lib/libisccc-9.16.13.so moved to /usr/lib/libisccc-9.16.15.so
  /usr/lib/libisccfg-9.16.13.so moved to /usr/lib/libisccfg-9.16.15.so
  /usr/lib/libns-9.16.13.so moved to /usr/lib/libns-9.16.15.so

--===============3823645260620502542==--
