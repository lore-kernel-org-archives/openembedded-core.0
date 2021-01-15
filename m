Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.700.1610713822710119607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id E50E238C1404
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.26.4 SUCCEEDED
Message-ID: <MADEUP.165A67B0B09C804E.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146806
Content-Type: multipart/mixed; boundary="===============0819499335385285457=="

--===============0819499335385285457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.26.3-1.26.4.patch
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

--===============0819499335385285457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.45.2 to libmpg123.so.0.45.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.45.2 to libmpg123.so.0.45.3
  /usr/lib/libmpg123.so.0.45.2 moved to /usr/lib/libmpg123.so.0.45.3

--===============0819499335385285457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.26.3-1.26.4.patch"

From ba26d24efef4b358112747e189f7334130f29aea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:34:50 +0000
Subject: [PATCH] mpg123: upgrade 1.26.3 -> 1.26.4

---
 .../{mpg123_1.26.3.bb => mpg123_1.26.4.bb}    | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.3.bb => mpg123_1.26.4.bb} (72%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
similarity index 72%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
index 0746d8d47d..6b917602ef 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  
+#  Main message, to include in "About ..." boxes, etc:
+#  
+# -	Copyright (c) 1995-2013 by Michael Hipp and others,
+# +	Copyright (c) 1995-2020 by Michael Hipp and others,
+#  	free software under the terms of the LGPL v2.1
+#  
+#  There is an attempt to cover the actual list of authors in the AUTHORS file.
+# 
+#
+
 SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3"
 DESCRIPTION = "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding library, which can be used by other programs. \
 mpg123 also comes with a command-line tool which can playback using ALSA, PulseAudio, OSS, and several other APIs, \
@@ -7,10 +29,10 @@ BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
+SRC_URI[sha256sum] = "081991540df7a666b29049ad870f293cfa28863b36488ab4d58ceaa7b5846454"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.27.0


--===============0819499335385285457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.26.3.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.26.4.tar.bz2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2281060 to 2280632 (-0%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 163267 to 163655 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGSIZE changed from 40041 to 40053 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1635990 to 1637393 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.45.2", added "/usr/lib/libmpg123.so.0.45.3"
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.26.3" to "1.26.4"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.26.3 [default] to 1.26.4 [default]
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.45.2 to libmpg123.so.0.45.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.45.2 to libmpg123.so.0.45.3
  /usr/lib/libmpg123.so.0.45.2 moved to /usr/lib/libmpg123.so.0.45.3

--===============0819499335385285457==--
