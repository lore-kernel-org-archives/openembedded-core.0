Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.300.1615826520879316229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id BB57538C12A6
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.17.0 SUCCEEDED
Message-ID: <MADEUP.166C91A9412E5C38.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149517
Content-Type: multipart/mixed; boundary="===============7789947997971954506=="

--===============7789947997971954506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.16.4-1.17.0.patch
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

--===============7789947997971954506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.16.4.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.17.0.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-bin: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-dbg: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4480232 to 4863520 (+9%)
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-dev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGSIZE changed from 191975 to 191967 (-0%)
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGSIZE changed from 38565 to 41407 (+7%)
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-locale: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-ptest: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1138598 to 1179126 (+4%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3154797 to 3222080 (+2%)
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput-staticdev: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.16.4 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.16.4" to "1.17.0"
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-analyze-recording /usr/libexec/libinput/libinput-analyze-touch-down-state"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1008202 to 1052519 (+4%)

--===============7789947997971954506==
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

--===============7789947997971954506==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.16.4-1.17.0.patch"

From 2c618da3b7f4935f73a8819892ee272c45771443 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 13:06:24 +0000
Subject: [PATCH] libinput: upgrade 1.16.4 -> 1.17.0

---
 .../wayland/{libinput_1.16.4.bb => libinput_1.17.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.4.bb => libinput_1.17.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.4.bb b/meta/recipes-graphics/wayland/libinput_1.17.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.0.bb
index 17b73e3827..c424a16533 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "65923a06d5a8970e4a999c4668797b9b689614b62b1d44432ab1c87b65e39e29"
+SRC_URI[sha256sum] = "c560cfca14cb5c50d2a1b7551df06bc5d4306e32c128f3e3d37e137285dedbad"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


--===============7789947997971954506==--
