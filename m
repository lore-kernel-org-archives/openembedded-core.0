Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.6804.1622200976148753698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6E88E38C139E
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libepoxy: upgrading to 1.5.8 SUCCEEDED
Message-ID: <MADEUP.16833731840FDACC.3006@lists.openembedded.org>
X-Groupsio-MsgNum: 152352
Content-Type: multipart/mixed; boundary="===============0802279647209436359=="

--===============0802279647209436359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libepoxy* to *1.5.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libepoxy-upgrade-1.5.5-1.5.8.patch
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

--===============0802279647209436359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libepoxy: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy: SRC_URI changed from "https://github.com/anholt/libepoxy/releases/download/1.5.5/libepoxy-1.5.5.tar.xz file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch" to "https://github.com/anholt/libepoxy/releases/download/1.5.8/libepoxy-1.5.8.tar.xz file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch"
packages/core2-32-poky-linux/libepoxy: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-dbg: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-dbg: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-dev: PKGSIZE changed from 1664820 to 1665100 (+0%)
packages/core2-32-poky-linux/libepoxy/libepoxy-dev: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-dev: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-doc: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-doc: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-locale: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-locale: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-src: PKGSIZE changed from 5508135 to 5508415 (+0%)
packages/core2-32-poky-linux/libepoxy/libepoxy-src: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-src: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy-staticdev: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy-staticdev: PKGV changed from 1.5.5 [default] to 1.5.8 [default]
packages/core2-32-poky-linux/libepoxy/libepoxy: PV changed from "1.5.5" to "1.5.8"
packages/core2-32-poky-linux/libepoxy/libepoxy: PKGV changed from 1.5.5 [default] to 1.5.8 [default]

--===============0802279647209436359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libepoxy-upgrade-1.5.5-1.5.8.patch"

From 710f85ef67af347f7bd0ecc3ff99e294cea271bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 09:08:33 +0000
Subject: [PATCH] libepoxy: upgrade 1.5.5 -> 1.5.8

---
 .../libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.8.bb} (93%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
similarity index 93%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
index a404fe2852..2cd096a579 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556"
+SRC_URI[sha256sum] = "cf05e4901778c434aef68bb7dc01bea2bce15440c0cecb777fb446f04db6fe0d"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.27.0


--===============0802279647209436359==--
