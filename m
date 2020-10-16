Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12524.1602843683381519813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4E42038C17CD
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] freetype: upgrading to 2.10.3 SUCCEEDED
Message-ID: <MADEUP.163E71D6F6BC6108.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143468
Content-Type: multipart/mixed; boundary="===============9090190842975131947=="

--===============9090190842975131947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *freetype* to *2.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-freetype-upgrade-2.10.2-2.10.3.patch
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

--===============9090190842975131947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/freetype/freetype-dev: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-doc: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-locale: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-staticdev: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
Changes to packages/core2-32-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.17.2 to libfreetype.so.6.17.3
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.17.2 to libfreetype.so.6.17.3
  /usr/lib/libfreetype.so.6.17.2 moved to /usr/lib/libfreetype.so.6.17.3
  /usr/include/freetype2/freetype/config/integer-types.h was added
  /usr/include/freetype2/freetype/config/mac-support.h was added
  /usr/include/freetype2/freetype/config/public-macros.h was added

--===============9090190842975131947==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-freetype-upgrade-2.10.2-2.10.3.patch"

From 72d75e426bcd2195faa7c8841145013192a400ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:43:12 +0000
Subject: [PATCH] freetype: upgrade 2.10.2 -> 2.10.3

---
 .../freetype/{freetype_2.10.2.bb => freetype_2.10.3.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.2.bb => freetype_2.10.3.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.2.bb b/meta/recipes-graphics/freetype/freetype_2.10.3.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.10.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.3.bb
index 1034ddc0d7..3255ed461e 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.3.bb
@@ -15,8 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
-SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
+SRC_URI[sha256sum] = "c22244bc766b2d8152f22db7370965431dcb1e408260428208c24984f78e6659"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.18.4


--===============9090190842975131947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/freetype/freetype-dbg: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-dbg: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-dbg: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype-dbg: PKGSIZE changed from 2561160 to 2565084 (+0%)
packages/core2-32-poky-linux/freetype/freetype-dev: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-dev: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-dev: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype-dev: PKGSIZE changed from 801729 to 795639 (-1%)
packages/core2-32-poky-linux/freetype/freetype-doc: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-doc: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-doc: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype-locale: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-locale: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-locale: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype-src: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-src: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-src: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype-src: PKGSIZE changed from 5257648 to 5261363 (+0%)
packages/core2-32-poky-linux/freetype/freetype-staticdev: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype-staticdev: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype-staticdev: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.17.2", added "/usr/lib/libfreetype.so.6.17.3"
packages/core2-32-poky-linux/freetype/freetype: PV changed from "2.10.2" to "2.10.3"
packages/core2-32-poky-linux/freetype/freetype: PKGSIZE changed from 742705 to 730417 (-2%)
packages/core2-32-poky-linux/freetype: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-32-poky-linux/freetype: PV changed from "2.10.2" to "2.10.3"
Changes to packages/core2-32-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.17.2 to libfreetype.so.6.17.3
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.17.2 to libfreetype.so.6.17.3
  /usr/lib/libfreetype.so.6.17.2 moved to /usr/lib/libfreetype.so.6.17.3
  /usr/include/freetype2/freetype/config/integer-types.h was added
  /usr/include/freetype2/freetype/config/mac-support.h was added
  /usr/include/freetype2/freetype/config/public-macros.h was added

--===============9090190842975131947==--
