Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87387CA101C
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.89789.1756850183449696454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Yom9glRZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VrrvMLeD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101990c6e59ac-48940203-461b-4fd5-a025-a3748f616d2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850182;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GhpapIs+ijnC73VejkbwUkW/QV+P8ctkBFUMGblCmmM=;
	b=Yom9glRZef0VByABrnjsZJVvopFXKZ2VpwjubICxt0Lr/ZpWeuGl8c3KWEVqsjtB
	6j/bm+DGB0ow2cVDNWOwPG4yD1gd16B3deAhXYLtwwXXrgkKc29MuVOcZru4czkmwNX
	6fw9vJPPT7yfviGM88xU2ZRmuQzWGOLTNggrsSsI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850182;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GhpapIs+ijnC73VejkbwUkW/QV+P8ctkBFUMGblCmmM=;
	b=VrrvMLeDMURmog2sc3ARjE1uMprlIX0NF1LeylvW312XQ/LNFcaicYun+FfB8mHT
	4MGN2a6HJ/0w9JDfNUJT2eS+VOjCnt9EEW1j63efcpSy9fz3rK97SCycscTp+htGi/x
	RV0lCW9u/+TjK/pyNsg6QpQYtt2ZDwZ4oFvlPjwI=
Content-Type: multipart/mixed; boundary="===============1925735092562828466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xdpyinfo,xeyes: upgrading to 1.4.0,1.3.1 SUCCEEDED
Message-ID: <010101990c6e59ac-48940203-461b-4fd5-a025-a3748f616d2d-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222757

--===============1925735092562828466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xdpyinfo,xeyes* to *1.4.0,1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xdpyinfo-xeyes-upgrade-1.3.4-1.4.0-1.3.0-1.3.1.patch
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
From cc36e913072745cfc1dd915a4be10c8600d66577 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 16:14:37 +0000
Subject: [PATCH] xdpyinfo,xeyes: upgrade 1.3.4 -> 1.4.0,1.3.0 -> 1.3.1

---
 .../xorg-app/xdpyinfo/disable-xkb.patch       | 18 +++++++++++----
 .../{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb}  |  2 +-
 .../{xeyes_1.3.0.bb => xeyes_1.3.1.bb}        | 23 +++++++++++++++++--
 3 files changed, 35 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb} (88%)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.3.0.bb => xeyes_1.3.1.bb} (29%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
index 1e8199cc66..0bee05df9e 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
@@ -1,10 +1,18 @@
+From 3cd25cc65cd27254aa9f7aba73c2b606c196f4bd Mon Sep 17 00:00:00 2001
+From: Chris Larson <kergoth@openedhand.com>
+Date: Tue, 15 Aug 2006 11:58:37 +0000
+Subject: [PATCH] Numerous new xorg package versions from upstream OE.  Pester
+
 Upstream-Status: Pending
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
 
-Index: xdpyinfo-1.3.0/configure.ac
-===================================================================
---- xdpyinfo-1.3.0.orig/configure.ac	2011-10-21 21:34:21.000000000 -0700
-+++ xdpyinfo-1.3.0/configure.ac	2011-11-28 20:06:56.554056935 -0800
-@@ -47,11 +47,15 @@
+diff --git a/configure.ac b/configure.ac
+index 9d03e8b..eef369b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,11 +49,15 @@ PKG_CHECK_MODULES(DPY_XEXT, xext,
  	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[#include <X11/Xlib.h>])
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
  
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
index 3becd40281..804b284352 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
@@ -15,6 +15,6 @@ PE = "1"
 SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b"
+SRC_URI[sha256sum] = "dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638cab3e530ff081a48b6"
 
 EXTRA_OECONF = "--disable-xkb"
diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
similarity index 29%
rename from meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
index 3d1a7063ea..1ded6d8e16 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
@@ -1,3 +1,22 @@
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
+# @@ -1,4 +1,5 @@
+#  Copyright (c) 1991  X Consortium
+# +Copyright (c) 2023  q3k
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining
+#  a copy of this software and associated documentation files (the
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "X11 eyes that follow the mouse cursor demo"
@@ -6,9 +25,9 @@ follow the location of the mouse cursor around the screen."
 
 PE = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=29277094da1ef0646d5634a79cb0c1c5"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0950c600bf33447e169a539ee6655ef9f36d6cebf2c1be67f7ab55dacb753023"
+SRC_URI[sha256sum] = "5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender libxi"
-- 
2.47.1


--===============1925735092562828466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xdpyinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xdpyinfo-1.3.4.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xdpyinfo-1.4.0.tar.xz file://disable-xkb.patch"
packages/x86-64-v3-poky-linux/xdpyinfo: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGSIZE changed from 85496 to 85992 (+1%)
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-dbg: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-dev: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-dev: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-doc: PKGSIZE changed from 2876 to 3064 (+7%)
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-doc: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-doc: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-locale: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-locale: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-src: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-src: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-staticdev: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo-staticdev: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/xdpyinfo/xdpyinfo: PV changed from "1.3.4" to "1.4.0"
packages/x86-64-v3-poky-linux/xeyes: SRC_URI changed from "https://www.x.org/releases//individual/app/xeyes-1.3.0.tar.xz" to "https://www.x.org/releases//individual/app/xeyes-1.3.1.tar.xz"
packages/x86-64-v3-poky-linux/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-dbg: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-dev: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGSIZE changed from 1864 to 1885 (+1%)
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes: PV changed from "1.3.0" to "1.3.1"

--===============1925735092562828466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xdpyinfo-xeyes-upgrade-1.3.4-1.4.0-1.3.0-1.3.1.patch"

RnJvbSBjYzM2ZTkxMzA3Mjc0NWNmYzFkZDkxNWE0YmUxMGM4NjAwZDY2NTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNjoxNDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhk
cHlpbmZvLHhleWVzOiB1cGdyYWRlIDEuMy40IC0+IDEuNC4wLDEuMy4wIC0+IDEuMy4xCgotLS0K
IC4uLi94b3JnLWFwcC94ZHB5aW5mby9kaXNhYmxlLXhrYi5wYXRjaCAgICAgICB8IDE4ICsrKysr
KysrKysrLS0tLQogLi4uL3t4ZHB5aW5mb18xLjMuNC5iYiA9PiB4ZHB5aW5mb18xLjQuMC5iYn0g
IHwgIDIgKy0KIC4uLi97eGV5ZXNfMS4zLjAuYmIgPT4geGV5ZXNfMS4zLjEuYmJ9ICAgICAgICB8
IDIzICsrKysrKysrKysrKysrKysrLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAv
e3hkcHlpbmZvXzEuMy40LmJiID0+IHhkcHlpbmZvXzEuNC4wLmJifSAoODglKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGV5ZXNfMS4zLjAuYmIgPT4geGV5ZXNfMS4z
LjEuYmJ9ICgyOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBw
L3hkcHlpbmZvL2Rpc2FibGUteGtiLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hkcHlpbmZvL2Rpc2FibGUteGtiLnBhdGNoCmluZGV4IDFlODE5OWNjNjYuLjBiZWUwNWRm
OWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mby9k
aXNhYmxlLXhrYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRw
eWluZm8vZGlzYWJsZS14a2IucGF0Y2gKQEAgLTEsMTAgKzEsMTggQEAKK0Zyb20gM2NkMjVjYzY1
Y2QyNzI1NGFhOWY3YWJhNzNjMmI2MDZjMTk2ZjRiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IENocmlzIExhcnNvbiA8a2VyZ290aEBvcGVuZWRoYW5kLmNvbT4KK0RhdGU6IFR1ZSwg
MTUgQXVnIDIwMDYgMTE6NTg6MzcgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gTnVtZXJvdXMgbmV3
IHhvcmcgcGFja2FnZSB2ZXJzaW9ucyBmcm9tIHVwc3RyZWFtIE9FLiAgUGVzdGVyCisKIFVwc3Ry
ZWFtLVN0YXR1czogUGVuZGluZworLS0tCisgY29uZmlndXJlLmFjIHwgNCArKysrCisgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCi1JbmRleDogeGRweWluZm8tMS4zLjAvY29uZmln
dXJlLmFjCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0geGRweWluZm8tMS4zLjAub3JpZy9jb25maWd1cmUuYWMJ
MjAxMS0xMC0yMSAyMTozNDoyMS4wMDAwMDAwMDAgLTA3MDAKLSsrKyB4ZHB5aW5mby0xLjMuMC9j
b25maWd1cmUuYWMJMjAxMS0xMS0yOCAyMDowNjo1Ni41NTQwNTY5MzUgLTA4MDAKLUBAIC00Nywx
MSArNDcsMTUgQEAKK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKK2lu
ZGV4IDlkMDNlOGIuLmVlZjM2OWIgMTAwNjQ0CistLS0gYS9jb25maWd1cmUuYWMKKysrKyBiL2Nv
bmZpZ3VyZS5hYworQEAgLTQ5LDExICs0OSwxNSBAQCBQS0dfQ0hFQ0tfTU9EVUxFUyhEUFlfWEVY
VCwgeGV4dCwKICAJQUNfQ0hFQ0tfSEVBREVSUyhbWDExL2V4dGVuc2lvbnMvbXVsdGlidWYuaCBY
MTEvZXh0ZW5zaW9ucy9YU2htLmhdLCwsWyNpbmNsdWRlIDxYMTEvWGxpYi5oPl0pCiAgCUNQUEZM
QUdTPSIkU0FWRV9DUFBGTEFHUyJdLFtlY2hvICJub3QgZm91bmQiXSkKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mb18xLjMuNC5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mb18xLjQuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWlu
Zm9fMS4zLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5
aW5mb18xLjQuMC5iYgppbmRleCAzYmVjZDQwMjgxLi44MDRiMjg0MzUyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWluZm9fMS4zLjQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hkcHlpbmZvXzEuNC4wLmJiCkBAIC0xNSw2ICsx
NSw2IEBAIFBFID0gIjEiCiBTUkNfVVJJICs9ICJmaWxlOi8vZGlzYWJsZS14a2IucGF0Y2giCiAK
IFNSQ19VUklfRVhUID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE4YWRhNTgxZGJkNzI2
NjQ0MGQ3YzM3OTRmYTg5ZWRmNmI5OWI4ODU3ZmMyZThjMzEwNDI2ODRmM2FmNDgyMmIiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZGMxZGU2ZTZlMDkxZWQ0NmM0ODM3YjBhZTk4MTFlODE4MmY3YmUw
ZDJhZjYzOGNhYjNlNTMwZmYwODFhNDhiNiIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS14
a2IiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV5ZXNfMS4z
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV5ZXNfMS4zLjEuYmIKc2lt
aWxhcml0eSBpbmRleCAyOSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hleWVzXzEuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAveGV5ZXNfMS4zLjEuYmIKaW5kZXggM2QxYTcwNjNlYS4uMWRlZDZkOGUxNiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVzXzEuMy4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXllc18xLjMuMS5iYgpAQCAtMSwzICsxLDIy
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAt
MSw0ICsxLDUgQEAKKyMgIENvcHlyaWdodCAoYykgMTk5MSAgWCBDb25zb3J0aXVtCisjICtDb3B5
cmlnaHQgKGMpIDIwMjMgIHEzaworIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVk
LCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcKKyMgIGEgY29weSBvZiB0
aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZQorIyAK
KyMKKwogcmVxdWlyZSB4b3JnLWFwcC1jb21tb24uaW5jCiAKIFNVTU1BUlkgPSAiWDExIGV5ZXMg
dGhhdCBmb2xsb3cgdGhlIG1vdXNlIGN1cnNvciBkZW1vIgpAQCAtNiw5ICsyNSw5IEBAIGZvbGxv
dyB0aGUgbG9jYXRpb24gb2YgdGhlIG1vdXNlIGN1cnNvciBhcm91bmQgdGhlIHNjcmVlbi4iCiAK
IFBFID0gIjEiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTNlYTUx
YjM2NTA1MWFjMzJkMTgxM2E3ZGJhYTRiZmM2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9MjkyNzcwOTRkYTFlZjA2NDZkNTYzNGE3OWNiMGMxYzUiCiAKIFNSQ19VUklf
RVhUID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5NTBjNjAwYmYzMzQ0N2UxNjlhNTM5
ZWU2NjU1ZWY5ZjM2ZDZjZWJmMmMxYmU2N2Y3YWI1NWRhY2I3NTMwMjMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNTYwOGQ3NmI3YjFhYWM1ZWQ3ZjIyZjFiNmI1YWQ3NGVmOThjODY5MzIyMGYzMmI0
Yjg3ZGNjZWU0YTk1NmVhYSIKIAogREVQRU5EUyArPSAibGlieGF1IGxpYnh0IGxpYnhleHQgbGli
eG11IGxpYnhyZW5kZXIgbGlieGkiCi0tIAoyLjQ3LjEKCg==

--===============1925735092562828466==--

