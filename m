Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.6896.1622200976599094716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 766EB38C13A9
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.17.3 SUCCEEDED
Message-ID: <MADEUP.168337318F44595E.665@lists.openembedded.org>
X-Groupsio-MsgNum: 152359
Content-Type: multipart/mixed; boundary="===============1104336216521832222=="

--===============1104336216521832222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.17.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.17.2-1.17.3.patch
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

--===============1104336216521832222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.17.2.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.17.3.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.17.2 [default] to 1.17.3 [default]
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1050003 to 1053188 (+0%)
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.17.2" to "1.17.3"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.17.2 [default] to 1.17.3 [default]

--===============1104336216521832222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.17.2-1.17.3.patch"

From 850e64e92cd74be7701663cab0fea5167b81d90a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 09:31:47 +0000
Subject: [PATCH] libinput: upgrade 1.17.2 -> 1.17.3

---
 .../wayland/{libinput_1.17.2.bb => libinput_1.17.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.2.bb => libinput_1.17.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.2.bb b/meta/recipes-graphics/wayland/libinput_1.17.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.17.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.3.bb
index e4a8e1a3d8..ef19146f79 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1"
+SRC_URI[sha256sum] = "0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.27.0


--===============1104336216521832222==--
