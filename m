Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.23882.1608473713769413906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5DA1338C1314
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 1.8.2 SUCCEEDED
Message-ID: <MADEUP.1652725219C62A57.28097@lists.openembedded.org>
X-Groupsio-MsgNum: 145917
Content-Type: multipart/mixed; boundary="===============7425533695182418050=="

--===============7425533695182418050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-1.8.1-1.8.2.patch
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

--===============7425533695182418050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 259214548 to 259215356 (+0%)
packages/core2-32-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 894379 to 895017 (+0%)
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea-locale: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-locale: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-locale: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea-src: PKGSIZE changed from 8224585 to 8224586 (+0%)
packages/core2-32-poky-linux/kea/kea-src: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea-staticdev: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17 /usr/lib/libkea-hooks.so.17.0.0"
packages/core2-32-poky-linux/kea/kea: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea/kea: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/kea: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/1.8.1/kea-1.8.1.tar.gz file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/1.8.2/kea-1.8.2.tar.gz file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
packages/core2-32-poky-linux/kea: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.16.0.0 to libkea-hooks.so.17.0.0
  /usr/lib/libkea-hooks.so.16.0.0 moved to /usr/lib/libkea-hooks.so.17.0.0
  /usr/lib/libkea-hooks.so.16 moved to /usr/lib/libkea-hooks.so.17

--===============7425533695182418050==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-kea-upgrade-1.8.1-1.8.2.patch"

From eea092157a50361cc43b1b8165099d7d49ded380 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 21:15:27 +0000
Subject: [PATCH] kea: upgrade 1.8.1 -> 1.8.2

---
 meta/recipes-connectivity/kea/{kea_1.8.1.bb => kea_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.8.1.bb => kea_1.8.2.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_1.8.1.bb b/meta/recipes-connectivity/kea/kea_1.8.2.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_1.8.1.bb
rename to meta/recipes-connectivity/kea/kea_1.8.2.bb
index 3a2ccf5c1f..3dc4f6af70 100644
--- a/meta/recipes-connectivity/kea/kea_1.8.1.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "52020cb16889484b661746d7fc4c7cd88974b1af5b7fc436eb6e69c62eb83734"
+SRC_URI[sha256sum] = "486ca7abedb9d6fdf8e4344ad8688d1171f2ef0f5506d118988aadeae80a1d39"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.20.1


--===============7425533695182418050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17.0.0 /usr/lib/libkea-hooks.so.17"
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17.0.0 /usr/lib/libkea-hooks.so.17"
packages/core2-32-poky-linux/kea/kea-locale: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17.0.0 /usr/lib/libkea-hooks.so.17"
packages/core2-32-poky-linux/kea/kea-staticdev: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17.0.0 /usr/lib/libkea-hooks.so.17"
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.16 /usr/lib/libkea-hooks.so.16.0.0", added "/usr/lib/libkea-hooks.so.17.0.0 /usr/lib/libkea-hooks.so.17"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.16.0.0 to libkea-hooks.so.17.0.0
  /usr/lib/libkea-hooks.so.16.0.0 moved to /usr/lib/libkea-hooks.so.17.0.0
  /usr/lib/libkea-hooks.so.16 moved to /usr/lib/libkea-hooks.so.17

--===============7425533695182418050==--
