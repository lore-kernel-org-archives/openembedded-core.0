Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.688.1610713822595446391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B377538C13EC
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B08B5B694B.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146797
Content-Type: multipart/mixed; boundary="===============6655176498983603863=="

--===============6655176498983603863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.18.2-1.18.3.patch
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

--===============6655176498983603863==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.18.2-1.18.3.patch"

From e20dbbd888b7e18bf1a997daf26282db710d0b33 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 10:33:43 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.18.2 -> 1.18.3

---
 .../{gstreamer1.0-omx_1.18.2.bb => gstreamer1.0-omx_1.18.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.2.bb => gstreamer1.0-omx_1.18.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
index 686fcc2655..797ed60722 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4"
+SRC_URI[sha256sum] = "ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.27.0


--===============6655176498983603863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.3.tar.xz"

--===============6655176498983603863==--
