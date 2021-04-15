Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5E32338C1438
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xkbcomp: upgrading to 1.4.5 SUCCEEDED
Message-ID: <MADEUP.16761AD15EBDC067.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150562
Content-Type: multipart/mixed; boundary="===============6406023318379085844=="

--===============6406023318379085844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xkbcomp* to *1.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkbcomp-upgrade-1.4.4-1.4.5.patch
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

--===============6406023318379085844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xkbcomp-upgrade-1.4.4-1.4.5.patch"

From 78920fe37837e97874372380027ff10ecc36999d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 14:04:15 +0000
Subject: [PATCH] xkbcomp: upgrade 1.4.4 -> 1.4.5

---
 .../{xkbcomp_1.4.4.bb => xkbcomp_1.4.5.bb}    | 81 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.4.bb => xkbcomp_1.4.5.bb} (10%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
similarity index 10%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
index 44143a04ca..05d19ddb06 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
@@ -1,3 +1,80 @@
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
+# @@ -5,19 +5,19 @@
+#  fee is hereby granted, provided that the above copyright
+#  notice appear in all copies and that both that copyright
+#  notice and this permission notice appear in supporting
+# -documentation, and that the name of Silicon Graphics not be 
+# -used in advertising or publicity pertaining to distribution 
+# +documentation, and that the name of Silicon Graphics not be
+# +used in advertising or publicity pertaining to distribution
+#  of the software without specific prior written permission.
+# -Silicon Graphics makes no representation about the suitability 
+# +Silicon Graphics makes no representation about the suitability
+#  of this software for any purpose. It is provided "as is"
+#  without any express or implied warranty.
+#  
+# -SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
+# -SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY 
+# +SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
+# +SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+#  AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
+# -GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL 
+# -DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, 
+# -DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE 
+# +GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
+# +DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+# +DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
+#  OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
+#  THE USE OR PERFORMANCE OF THIS SOFTWARE.
+#  
+# @@ -49,13 +49,13 @@
+#  
+#                          All Rights Reserved
+#  
+# -Permission to use, copy, modify, and distribute this software and its 
+# -documentation for any purpose and without fee is hereby granted, 
+# +Permission to use, copy, modify, and distribute this software and its
+# +documentation for any purpose and without fee is hereby granted,
+#  provided that the above copyright notice appear in all copies and that
+# -both that copyright notice and this permission notice appear in 
+# +both that copyright notice and this permission notice appear in
+#  supporting documentation, and that the name of Digital not be
+#  used in advertising or publicity pertaining to distribution of the
+# -software without specific, written prior permission.  
+# +software without specific, written prior permission.
+#  
+#  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
+#  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
+# @@ -73,8 +73,8 @@
+#  
+#  THE INFORMATION IN THIS SOFTWARE IS SUBJECT TO CHANGE WITHOUT NOTICE AND
+#  SHOULD NOT BE CONSTRUED AS A COMMITMENT BY DIGITAL EQUIPMENT CORPORATION.
+# -DIGITAL MAKES NO REPRESENTATIONS ABOUT THE SUITABILITY OF THIS SOFTWARE 
+# -FOR ANY PURPOSE.  IT IS SUPPLIED "AS IS" WITHOUT EXPRESS OR IMPLIED 
+# +DIGITAL MAKES NO REPRESENTATIONS ABOUT THE SUITABILITY OF THIS SOFTWARE
+# +FOR ANY PURPOSE.  IT IS SUPPLIED "AS IS" WITHOUT EXPRESS OR IMPLIED
+#  WARRANTY.
+#  
+#  IF THE SOFTWARE IS MODIFIED IN A MANNER CREATING DERIVATIVE COPYRIGHT
+# @@ -86,5 +86,5 @@
+#  that the above copyright notice appear in all copies and that both that
+#  copyright notice and this permission notice appear in supporting
+#  documentation, and that the name of Digital Equipment Corporation not be
+# -used in advertising or publicity pertaining to distribution of the 
+# +used in advertising or publicity pertaining to distribution of the
+#  software without specific, written prior permission.
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "A program to compile XKB keyboard description"
@@ -7,7 +84,7 @@ XKB keymap into one of several output formats. The most common use for \
 xkbcomp is to create a compiled keymap file (.xkm extension) which can \
 be read directly by XKB-capable X servers or utilities."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be5e191f04d3f2cd80aa83b928ba984c"
 
 DEPENDS += "libxkbfile"
 
@@ -15,4 +92,4 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[sha256sum] = "59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e"
+SRC_URI[sha256sum] = "6851086c4244b6fd0cc562880d8ff193fb2bbf1e141c73632e10731b31d4b05e"
-- 
2.27.0


--===============6406023318379085844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xkbcomp: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp: SRC_URI changed from "https://www.x.org/releases//individual/app/xkbcomp-1.4.4.tar.bz2" to "https://www.x.org/releases//individual/app/xkbcomp-1.4.5.tar.bz2"
packages/core2-32-poky-linux/xkbcomp: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PKGSIZE changed from 520560 to 520552 (-0%)
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dev: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dev: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-doc: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-doc: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-locale: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-locale: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PKGSIZE changed from 580484 to 578506 (-0%)
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-staticdev: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-staticdev: PV changed from "1.4.4" to "1.4.5"
packages/core2-32-poky-linux/xkbcomp/xkbcomp: PKGV changed from 1.4.4 [default] to 1.4.5 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp: PV changed from "1.4.4" to "1.4.5"

--===============6406023318379085844==--
