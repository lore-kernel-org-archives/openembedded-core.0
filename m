Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.4690.1621074783788318693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B906F38C13F8
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.17.2 SUCCEEDED
Message-ID: <MADEUP.167F36EDAD9FD06A.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151827
Content-Type: multipart/mixed; boundary="===============6116857122162161281=="

--===============6116857122162161281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.17.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.17.1-1.17.2.patch
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

--===============6116857122162161281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libinput/libinput-bin: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-dev: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-locale: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-ptest: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-staticdev: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
Changes to packages/core2-32-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-gigabyte.quirks was added

--===============6116857122162161281==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.17.1-1.17.2.patch"

From 9004dec699e24ffa6303e07659d413feab1a4c5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:26:45 +0000
Subject: [PATCH] libinput: upgrade 1.17.1 -> 1.17.2

---
 .../wayland/{libinput_1.17.1.bb => libinput_1.17.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.1.bb => libinput_1.17.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.1.bb b/meta/recipes-graphics/wayland/libinput_1.17.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.17.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.2.bb
index 9ffb22876b..e4a8e1a3d8 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137"
+SRC_URI[sha256sum] = "b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.27.0


--===============6116857122162161281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.17.1.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.17.2.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput/libinput-bin: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-dbg: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4333344 to 4333432 (+0%)
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-dev: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-locale: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-ptest: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3224419 to 3224521 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput-staticdev: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.17.1" to "1.17.2"
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-gigabyte.quirks"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.17.1 [default] to 1.17.2 [default]
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1049339 to 1050003 (+0%)
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.17.1" to "1.17.2"
Changes to packages/core2-32-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-gigabyte.quirks was added

--===============6116857122162161281==--
