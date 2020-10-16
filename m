Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6B2B538C1689
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.16.2 SUCCEEDED
Message-ID: <MADEUP.163E71D712C9AF8A.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143480
Content-Type: multipart/mixed; boundary="===============7455525322618906642=="

--===============7455525322618906642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.16.1-1.16.2.patch
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

--===============7455525322618906642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4486196 to 4486540 (+0%)
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3154254 to 3154791 (+0%)
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.16.1" to "1.16.2"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1007100 to 1007550 (+0%)

--===============7455525322618906642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.16.1-1.16.2.patch"

From 5ab6193d09a22042d20d31a4be18660b8381200e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:06:10 +0000
Subject: [PATCH] libinput: upgrade 1.16.1 -> 1.16.2

---
 .../wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.1.bb b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.2.bb
index 1497609183..f4b1b4ddc2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539"
+SRC_URI[sha256sum] = "fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.18.4


--===============7455525322618906642==--
