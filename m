Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.722.1610713822916136885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CF06E38C128C
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B0BA9ACFF0.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146809
Content-Type: multipart/mixed; boundary="===============1614202296545916696=="

--===============1614202296545916696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.18.2-1.18.3.patch
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

--===============1614202296545916696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.18.2-1.18.3.patch"

From 9fef9e7a64ea5f347ffa39b1bce1e9c7379cbf5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:10:12 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.18.2 -> 1.18.3

---
 ...reamer1.0-python_1.18.2.bb => gstreamer1.0-python_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.2.bb => gstreamer1.0-python_1.18.3.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
index 5711744b4d..897d246793 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c"
+SRC_URI[sha256sum] = "4e630735276e08ff4d70337aa5d91fd008e5f1ed3dc0993674cd5820e264259a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.27.0


--===============1614202296545916696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-python: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-python: PKGV changed from 1.18.2 [default] to 1.18.3 [default]

--===============1614202296545916696==--
