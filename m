Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B78C531D7
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1771440097377364361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VUmPi5nJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ux9+lKrR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720ec568-78714733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OcjoWMouRFJFY2ysNlfJ8/kPw4StkHhQ7F5Ahl8hL6g=;
	b=VUmPi5nJUUotCXnTkPnKoCRqpkWuMSpfTFuJsYQJXAl3YOElRYIRdf8J2j0HmuHk
	Qe9xzzxBzHWnUY7mznVYT3AmH0A2sYp9M6jjbLhdq4RrKWCND9xjAyF5e2+PKAtXXsq
	psq+R+6wsAx/uRCOH9xpATEyo/B3i6SXTAn6kW/o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OcjoWMouRFJFY2ysNlfJ8/kPw4StkHhQ7F5Ahl8hL6g=;
	b=Ux9+lKrRm/NWHyGxPB9epHfXGcA3QAnB1CKIykdeqUmhGCK1vutf+Fg3PNP3UL+w
	lneVsDaj0hlqE535G2aec/JaJ7VFip5gyRGrgUsQL+8IY5rbjhuQfFUlhb/yZIDRIV4
	+h6plNnhbBLK2neVwtSUcU1T6tsk5lRwDyHX8514=
Content-Type: multipart/mixed; boundary="===============7979235209972295788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libx11,libfontenc: upgrading to 1.8.13,1.1.9 SUCCEEDED
Message-ID: <0101019c720ec568-78714733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231331

--===============7979235209972295788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libx11,libfontenc* to *1.8.13,1.1.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-libfontenc-upgrade-1.8.12-1.8.13-1.1.8-1.1.9.patch
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

-- >8 --
From caebf8d90715a66407a0ef5910707fb923d0161c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 10:55:08 +0000
Subject: [PATCH] libx11,libfontenc: upgrade 1.8.12 -> 1.8.13,1.1.8 -> 1.1.9

---
 ...ibfontenc_1.1.8.bb => libfontenc_1.1.9.bb} |  2 +-
 .../xorg-lib/libx11/disable_tests.patch       |  2 +-
 .../{libx11_1.8.12.bb => libx11_1.8.13.bb}    | 53 ++++++++++++++++++-
 3 files changed, 53 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.8.bb => libfontenc_1.1.9.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.12.bb => libx11_1.8.13.bb} (30%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
index 0fc117fc58..0727825112 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-SRC_URI[sha256sum] = "7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6"
+SRC_URI[sha256sum] = "9d8392705cb10803d5fe1d27d236cbab3f664e26841ce01916bbbe430cf273e2"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index d2c5f5f142..1e2d597f49 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,4 +1,4 @@
-From 37debe301336cfb61e7f81e9e47e5e1019177d8c Mon Sep 17 00:00:00 2001
+From 0bdc2a3e60c49eab8a8ddd09268b4275b8486260 Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Tue, 8 Jan 2013 09:16:37 +0200
 Subject: [PATCH] libx11: disable tests
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
similarity index 30%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
index 580e44889d..69c7dbe984 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -1,3 +1,52 @@
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
+# @@ -715,35 +715,6 @@
+#  
+#  		----------------------------------------
+#  
+# -(c) Copyright 1996 by Sebastien Marineau and Holger Veit
+# -			<marineau@genie.uottawa.ca>
+# -                     <Holger.Veit@gmd.de>
+# -
+# -Permission is hereby granted, free of charge, to any person obtaining a
+# -copy of this software and associated documentation files (the "Software"),
+# -to deal in the Software without restriction, including without limitation
+# -the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# -and/or sell copies of the Software, and to permit persons to whom the
+# -Software is furnished to do so, subject to the following conditions:
+# -
+# -The above copyright notice and this permission notice shall be included in
+# -all copies or substantial portions of the Software.
+# -
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# -HOLGER VEIT  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+# -WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
+# -OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# -SOFTWARE.
+# -
+# -Except as contained in this notice, the name of Sebastien Marineau or Holger Veit
+# -shall not be used in advertising or otherwise to promote the sale, use or other
+# -dealings in this Software without prior written authorization from Holger Veit or
+# -Sebastien Marineau.
+# -
+# -		----------------------------------------
+# -
+#  Copyright 1990, 1991 by OMRON Corporation, NTT Software Corporation,
+#                       and Nippon Telegraph and Telephone Corporation
+#  Copyright 1991 by the Open Software Foundation
+# 
+#
+
 SUMMARY = "Xlib: C Language X Interface library"
 
 DESCRIPTION = "This package provides a client interface to the X Window \
@@ -7,7 +56,7 @@ basic functions of the window system."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d49cdd2b386c5db11ec636d680b7116"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f2a1d92c4a50eedcf7c12672b908851"
 
 DEPENDS += "xorgproto \
             xtrans \
@@ -23,7 +72,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
+SRC_URI[sha256sum] = "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e607c0b5f94f11c"
 
 inherit gettext
 
-- 
2.47.1


--===============7979235209972295788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: RDEPENDS: added "zlib-dev"

--===============7979235209972295788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/encodings/encodings-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/encodings/encodings-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/encodings/encodings: FILES: removed "/bin/* /sbin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/libfontenc: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc: SRC_URI changed from "https://www.x.org/releases//individual/lib/libfontenc-1.1.8.tar.xz" to "https://www.x.org/releases//individual/lib/libfontenc-1.1.9.tar.xz"
packages/x86-64-v3-poky-linux/libfontenc: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dbg: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dbg: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PKGSIZE changed from 5226 to 5306 (+2%)
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: RDEPENDS: added "zlib-dev"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-doc: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-doc: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-locale: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-locale: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: FILELIST: directory renamed /usr/src/debug/libfontenc/1.1.8/src -> /usr/src/debug/libfontenc/1.1.9/src, directory renamed /usr/src/debug/libfontenc/1.1.8/include/X11/fonts -> /usr/src/debug/libfontenc/1.1.9/include/X11/fonts
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-staticdev: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-staticdev: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PV changed from "1.1.8" to "1.1.9"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PKGV changed from 1.1.8 [default] to 1.1.9 [default]
packages/x86-64-v3-poky-linux/libx11: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.8.12.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.8.13.tar.xz file://disable_tests.patch"
packages/x86-64-v3-poky-linux/libx11: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 11432448 to 11433136 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-dev: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-dev: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-doc: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1931623 to 1930583 (-0%)
packages/x86-64-v3-poky-linux/libx11/libx11-doc: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1107098 to 1106701 (-0%)
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-src: FILELIST: directory renamed /usr/src/debug/libx11/1.8.12/modules/lc/gen -> /usr/src/debug/libx11/1.8.13/modules/lc/gen, directory renamed /usr/src/debug/libx11/1.8.12/modules/lc/def -> /usr/src/debug/libx11/1.8.13/modules/lc/def, directory renamed /usr/src/debug/libx11/1.8.12/src -> /usr/src/debug/libx11/1.8.13/src, directory renamed /usr/src/debug/libx11/1.8.12/src/xcms -> /usr/src/debug/libx11/1.8.13/src/xcms, directory renamed /usr/src/debug/libx11/1.8.12/modules/lc/Utf8 -> /usr/src/debug/libx11/1.8.13/modules/lc/Utf8, directory renamed /usr/src/debug/libx11/1.8.12/src/xkb -> /usr/src/debug/libx11/1.8.13/src/xkb, directory renamed /usr/src/debug/libx11/1.8.12/include/X11/extensions -> /usr/src/debug/libx11/1.8.13/include/X11/extensions, directory renamed /usr/src/debug/libx11/1.8.12/modules/om/generic -> /usr/src/debug/libx11/1.8.13/modules/om/generic, directory renamed /usr/src/debug/libx11/1.8.12/modules/im/ximcp -> /usr/src/debug
 /libx11/1.8.13/modules/im/ximcp, directory renamed /usr/src/debug/libx11/1.8.12/src/xlibi18n -> /usr/src/debug/libx11/1.8.13/src/xlibi18n, directory renamed /usr/src/debug/libx11/1.8.12/src/xlibi18n/lcUniConv -> /usr/src/debug/libx11/1.8.13/src/xlibi18n/lcUniConv, directory renamed /usr/src/debug/libx11/1.8.12/include/X11 -> /usr/src/debug/libx11/1.8.13/include/X11
packages/x86-64-v3-poky-linux/libx11/libx11-src: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-src: PKGSIZE changed from 5443215 to 5444114 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-src: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-staticdev: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-xcb: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11-xcb: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/x86-64-v3-poky-linux/libx11/libx11: PV changed from "1.8.12" to "1.8.13"
packages/x86-64-v3-poky-linux/libx11/libx11: PKGSIZE changed from 1385631 to 1385614 (-0%)
packages/x86-64-v3-poky-linux/libx11/libx11: PKGV changed from 1.8.12 [default] to 1.8.13 [default]

--===============7979235209972295788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libx11-libfontenc-upgrade-1.8.12-1.8.13-1.1.8-1.1.9.patch"

RnJvbSBjYWViZjhkOTA3MTVhNjY0MDdhMGVmNTkxMDcwN2ZiOTIzZDAxNjFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTA6NTU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4MTEsbGliZm9udGVuYzogdXBncmFkZSAxLjguMTIgLT4gMS44LjEzLDEuMS44IC0+IDEuMS45
CgotLS0KIC4uLmliZm9udGVuY18xLjEuOC5iYiA9PiBsaWJmb250ZW5jXzEuMS45LmJifSB8ICAy
ICstCiAuLi4veG9yZy1saWIvbGlieDExL2Rpc2FibGVfdGVzdHMucGF0Y2ggICAgICAgfCAgMiAr
LQogLi4uL3tsaWJ4MTFfMS44LjEyLmJiID0+IGxpYngxMV8xLjguMTMuYmJ9ICAgIHwgNTMgKysr
KysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGliZm9u
dGVuY18xLjEuOC5iYiA9PiBsaWJmb250ZW5jXzEuMS45LmJifSAoODAlKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieDExXzEuOC4xMi5iYiA9PiBsaWJ4MTFfMS44
LjEzLmJifSAoMzAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9saWJmb250ZW5jXzEuMS44LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xp
YmZvbnRlbmNfMS4xLjkuYmIKc2ltaWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYmZvbnRlbmNfMS4xLjguYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJmb250ZW5jXzEuMS45LmJiCmluZGV4IDBm
YzExN2ZjNTguLjA3Mjc4MjUxMTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9saWJmb250ZW5jXzEuMS44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9saWJmb250ZW5jXzEuMS45LmJiCkBAIC0xMSw2ICsxMSw2IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk2MjU0YzIwYWI4MWM2M2U2NWIyNmYwZGJjZDRh
MWMxIgogREVQRU5EUyArPSAiemxpYiB4b3JncHJvdG8gZm9udC11dGlsIgogUEUgPSAiMSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjdiMDJjM2Q0MDUyMzZlMGQ4NjgwNmIxZGU5ZDY4NjhmZTYw
YzMxMzYyOGIzODM1MGIwMzI5MTRhYTRmZDE0YzYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWQ4
MzkyNzA1Y2IxMDgwM2Q1ZmUxZDI3ZDIzNmNiYWIzZjY2NGUyNjg0MWNlMDE5MTZiYmJlNDMwY2Yy
NzNlMiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExL2Rpc2FibGVfdGVzdHMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExL2Rpc2FibGVfdGVzdHMucGF0Y2gKaW5kZXgg
ZDJjNWY1ZjE0Mi4uMWUyZDU5N2Y0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYngxMS9kaXNhYmxlX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4MTEvZGlzYWJsZV90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMzdkZWJlMzAxMzM2Y2ZiNjFlN2Y4MWU5ZTQ3ZTVlMTAxOTE3N2Q4YyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGJkYzJhM2U2MGM0OWVhYjhhOGRkZDA5MjY4YjQyNzVi
ODQ4NjI2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmtvIExpbmRxdmlzdCA8
Y2F6Zmk3NEBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDggSmFuIDIwMTMgMDk6MTY6MzcgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGlieDExOiBkaXNhYmxlIHRlc3RzCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC4xMi5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTFfMS44LjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggMzAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTFfMS44LjEy
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC4x
My5iYgppbmRleCA1ODBlNDQ4ODlkLi42OWM3ZGJlOTg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC4xMy5iYgpAQCAtMSwzICsxLDUyIEBACisjIEZJ
WE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2Rl
dnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUg
TElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMg
dGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxl
OiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBj
aGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtNzE1LDM1ICs3
MTUsNiBAQAorIyAgCisjICAJCS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgIAorIyAtKGMpIENvcHlyaWdodCAxOTk2IGJ5IFNlYmFzdGllbiBNYXJpbmVhdSBhbmQg
SG9sZ2VyIFZlaXQKKyMgLQkJCTxtYXJpbmVhdUBnZW5pZS51b3R0YXdhLmNhPgorIyAtICAgICAg
ICAgICAgICAgICAgICAgPEhvbGdlci5WZWl0QGdtZC5kZT4KKyMgLQorIyAtUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5n
IGEKKyMgLWNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
IGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCisjIC10byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRo
b3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisjIC10aGUgcmln
aHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSwKKyMgLWFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBw
ZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQorIyAtU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRv
IHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgLQorIyAtVGhlIGFi
b3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUg
aW5jbHVkZWQgaW4KKyMgLWFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhl
IFNvZnR3YXJlLgorIyAtCisjIC1USEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyAtSU1QTElFRCwgSU5DTFVE
SU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFks
CisjIC1GSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5U
LiAgSU4gTk8gRVZFTlQgU0hBTEwKKyMgLUhPTEdFUiBWRUlUICBCRSBMSUFCTEUgRk9SIEFOWSBD
TEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksCisjIC1XSEVUSEVSIElOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GCisj
IC1PUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIg
REVBTElOR1MgSU4gVEhFCisjIC1TT0ZUV0FSRS4KKyMgLQorIyAtRXhjZXB0IGFzIGNvbnRhaW5l
ZCBpbiB0aGlzIG5vdGljZSwgdGhlIG5hbWUgb2YgU2ViYXN0aWVuIE1hcmluZWF1IG9yIEhvbGdl
ciBWZWl0CisjIC1zaGFsbCBub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvciBvdGhlcndpc2Ug
dG8gcHJvbW90ZSB0aGUgc2FsZSwgdXNlIG9yIG90aGVyCisjIC1kZWFsaW5ncyBpbiB0aGlzIFNv
ZnR3YXJlIHdpdGhvdXQgcHJpb3Igd3JpdHRlbiBhdXRob3JpemF0aW9uIGZyb20gSG9sZ2VyIFZl
aXQgb3IKKyMgLVNlYmFzdGllbiBNYXJpbmVhdS4KKyMgLQorIyAtCQktLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIC0KKyMgIENvcHlyaWdodCAxOTkwLCAxOTkxIGJ5
IE9NUk9OIENvcnBvcmF0aW9uLCBOVFQgU29mdHdhcmUgQ29ycG9yYXRpb24sCisjICAgICAgICAg
ICAgICAgICAgICAgICBhbmQgTmlwcG9uIFRlbGVncmFwaCBhbmQgVGVsZXBob25lIENvcnBvcmF0
aW9uCisjICBDb3B5cmlnaHQgMTk5MSBieSB0aGUgT3BlbiBTb2Z0d2FyZSBGb3VuZGF0aW9uCisj
IAorIworCiBTVU1NQVJZID0gIlhsaWI6IEMgTGFuZ3VhZ2UgWCBJbnRlcmZhY2UgbGlicmFyeSIK
IAogREVTQ1JJUFRJT04gPSAiVGhpcyBwYWNrYWdlIHByb3ZpZGVzIGEgY2xpZW50IGludGVyZmFj
ZSB0byB0aGUgWCBXaW5kb3cgXApAQCAtNyw3ICs1Niw3IEBAIGJhc2ljIGZ1bmN0aW9ucyBvZiB0
aGUgd2luZG93IHN5c3RlbS4iCiByZXF1aXJlIHhvcmctbGliLWNvbW1vbi5pbmMKIAogTElDRU5T
RSA9ICJNSVQgJiBCU0QtMS1DbGF1c2UgJiBIUE5EICYgSFBORC1zZWxsLXZhcmlhbnQgJiBJU0Mi
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xZDQ5Y2RkMmIzODZjNWRi
MTFlYzYzNmQ2ODBiNzExNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PThmMmExZDkyYzRhNTBlZWRjZjdjMTI2NzJiOTA4ODUxIgogCiBERVBFTkRTICs9ICJ4b3JncHJv
dG8gXAogICAgICAgICAgICAgeHRyYW5zIFwKQEAgLTIzLDcgKzcyLDcgQEAgWE9SR19QTiA9ICJs
aWJYMTEiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9kaXNhYmxlX3Rlc3RzLnBhdGNoIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmEwMjZmOWJiMDEyNGY0ZDZjODA4ZjlhZWY0MDU3YWFkNjVlN2Iz
NWQ4ZmY0Mzk1MWNlZjBhYmUwNmJiOWE5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2OTYwNmY0
ODVjMmMwN2MxNGVmNjRmNzViN2JiMzI2ZDQ4NTg3YWYzMzc5NWQ5YWIzZTYwN2MwYjVmOTRmMTFj
IgogCiBpbmhlcml0IGdldHRleHQKIAotLSAKMi40Ny4xCgo=

--===============7979235209972295788==--

