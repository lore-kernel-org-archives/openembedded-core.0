Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.24427.1608473713772029634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5718C38C12E1
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.10 SUCCEEDED
Message-ID: <MADEUP.165272521AA01BB7.28097@lists.openembedded.org>
X-Groupsio-MsgNum: 145919
Content-Type: multipart/mixed; boundary="===============7077569870209031903=="

--===============7077569870209031903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.16.9-9.16.10.patch
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

--===============7077569870209031903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 11235812 to 11252664 (+0%)
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1593373 to 1595214 (+0%)
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 287503 to 287629 (+0%)
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 3798964 to 3807316 (+0%)
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9567381 to 9582844 (+0%)
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind: PKGV changed from 9.16.9 [default] to 9.16.10 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.16.9" to "9.16.10"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.16.9/bind-9.16.9.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.16.10/bind-9.16.10.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns.so.1609.0.0 to libdns.so.1610.0.0
  /usr/lib/libisccfg.so changed symlink target from libisccfg.so.1601.0.1 to libisccfg.so.1602.0.0
  /usr/lib/libisc.so.1608 changed symlink target from libisc.so.1608.0.0 to libisc.so.1608.0.1
  /usr/lib/libisc.so changed symlink target from libisc.so.1608.0.0 to libisc.so.1608.0.1
  /usr/lib/libns.so.1606 changed symlink target from libns.so.1606.0.0 to libns.so.1606.0.1
  /usr/lib/libns.so changed symlink target from libns.so.1606.0.0 to libns.so.1606.0.1
  /usr/lib/libdns.so.1609.0.0 moved to /usr/lib/libdns.so.1610.0.0
  /usr/lib/libdns.so.1609 moved to /usr/lib/libdns.so.1610
  /usr/lib/libisccfg.so.1601.0.1 moved to /usr/lib/libisccfg.so.1602.0.0
  /usr/lib/libisccfg.so.1601 moved to /usr/lib/libisccfg.so.1602
  /usr/lib/libisc.so.1608.0.0 moved to /usr/lib/libisc.so.1608.0.1
  /usr/lib/libns.so.1606.0.0 moved to /usr/lib/libns.so.1606.0.1

--===============7077569870209031903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns.so.1609.0.0 to libdns.so.1610.0.0
  /usr/lib/libisccfg.so changed symlink target from libisccfg.so.1601.0.1 to libisccfg.so.1602.0.0
  /usr/lib/libisc.so.1608 changed symlink target from libisc.so.1608.0.0 to libisc.so.1608.0.1
  /usr/lib/libisc.so changed symlink target from libisc.so.1608.0.0 to libisc.so.1608.0.1
  /usr/lib/libns.so.1606 changed symlink target from libns.so.1606.0.0 to libns.so.1606.0.1
  /usr/lib/libns.so changed symlink target from libns.so.1606.0.0 to libns.so.1606.0.1
  /usr/lib/libdns.so.1609.0.0 moved to /usr/lib/libdns.so.1610.0.0
  /usr/lib/libdns.so.1609 moved to /usr/lib/libdns.so.1610
  /usr/lib/libisccfg.so.1601.0.1 moved to /usr/lib/libisccfg.so.1602.0.0
  /usr/lib/libisccfg.so.1601 moved to /usr/lib/libisccfg.so.1602
  /usr/lib/libisc.so.1608.0.0 moved to /usr/lib/libisc.so.1608.0.1
  /usr/lib/libns.so.1606.0.0 moved to /usr/lib/libns.so.1606.0.1

--===============7077569870209031903==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.16.9-9.16.10.patch"

From 6533416149b8e8e56e917c0b967dfff7335a61c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 19:51:29 +0000
Subject: [PATCH] bind: upgrade 9.16.9 -> 9.16.10

---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/bind9                    | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/conf.patch               | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/generate-rndc-key.sh     | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/named.service            | 0
 .../bind/{bind_9.16.9.bb => bind_9.16.10.bb}                    | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.9.bb => bind_9.16.10.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/bind9 b/meta/recipes-connectivity/bind/bind-9.16.10/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.10/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.10/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/named.service b/meta/recipes-connectivity/bind/bind-9.16.10/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.10/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.9.bb b/meta/recipes-connectivity/bind/bind_9.16.10.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.9.bb
rename to meta/recipes-connectivity/bind/bind_9.16.10.bb
index be8a294a43..71194a61bf 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.10.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bcb292c4d738a46e3cbcb8afaa25ecf54f77652fa575135da9a2a1d525304a5a"
+SRC_URI[sha256sum] = "bc47fc019c6205e6a6bfb839c544a1472321df0537ba905b846a4cbffe3362b3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


--===============7077569870209031903==--
