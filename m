Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.39237.1605551304360827830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8BAC438C13CB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.16.3 SUCCEEDED
Message-ID: <MADEUP.16481067AC3ED9B8.25243@lists.openembedded.org>
X-Groupsio-MsgNum: 144657
Content-Type: multipart/mixed; boundary="===============0768351928146193599=="

--===============0768351928146193599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.16.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.16.2-1.16.3.patch
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

--===============0768351928146193599==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.16.2-1.16.3.patch"

From f693f5b98070f474167081aa40d7f600b8eeb587 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 17:10:57 +0000
Subject: [PATCH] libinput: upgrade 1.16.2 -> 1.16.3

---
 .../wayland/{libinput_1.16.2.bb => libinput_1.16.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.2.bb => libinput_1.16.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.2.bb b/meta/recipes-graphics/wayland/libinput_1.16.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.3.bb
index f4b1b4ddc2..8929de6ae0 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9"
+SRC_URI[sha256sum] = "dc5e1ae51ec1cc635ca96f61118b0f07dfea783cab0747a60f3555068bb077e4"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.20.1


--===============0768351928146193599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.16.2.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.16.3.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3154791 to 3154794 (+0%)
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.16.2 [default] to 1.16.3 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.16.2" to "1.16.3"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.16.2 [default] to 1.16.3 [default]

--===============0768351928146193599==--
