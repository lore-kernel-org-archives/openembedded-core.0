Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1351.1618510601697272735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5906438C13CF
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.17.1 SUCCEEDED
Message-ID: <MADEUP.16761AD159B1BD64.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150558
Content-Type: multipart/mixed; boundary="===============2260237779767576011=="

--===============2260237779767576011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.17.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.16.4-1.17.1.patch
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

--===============2260237779767576011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libinput/libinput-bin: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-dev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-locale: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-ptest: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-staticdev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"

--===============2260237779767576011==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.16.4-1.17.1.patch"

From 617412f3627f693d1453b563c4b4f21a89a65557 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 14:00:08 +0000
Subject: [PATCH] libinput: upgrade 1.16.4 -> 1.17.1

---
 .../wayland/{libinput_1.16.4.bb => libinput_1.17.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.4.bb => libinput_1.17.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.4.bb b/meta/recipes-graphics/wayland/libinput_1.17.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.1.bb
index 17b73e3827..9ffb22876b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "65923a06d5a8970e4a999c4668797b9b689614b62b1d44432ab1c87b65e39e29"
+SRC_URI[sha256sum] = "e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.27.0


--===============2260237779767576011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.16.4.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.17.1.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4480232 to 4868796 (+9%)
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGSIZE changed from 191975 to 191967 (-0%)
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGSIZE changed from 38565 to 41407 (+7%)
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1138598 to 1179126 (+4%)
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3154797 to 3224419 (+2%)
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.16.4" to "1.17.1"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.16.4 [default] to 1.17.1 [default]
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-analyze-touch-down-state /usr/libexec/libinput/libinput-analyze-recording"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1008202 to 1053435 (+4%)

--===============2260237779767576011==--
