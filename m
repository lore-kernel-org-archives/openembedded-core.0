Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB488CA0EE9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11320.1755263215402384407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2ojkBweX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g5H0iDIh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add73025-c44edf63-3cf2-4792-8a98-0aae4b1354c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ay/Ax+vKvdtXrdPetQw83gSjk7Ugf0EWg99U0XTUSXU=;
	b=2ojkBweXVoo0cVQyAks69Og84TCB1IQII1G19QaZCN/0JafHzSezd9xnCN/vQ4gt
	+eIiPfo1s4aKSKSoy7v1K0VWfdZsNuYMGD8tPDrLOgqFR087287v0LJIndIqVb3KLMf
	7wLj/BZA12QNrxvCh4xRsXvJOIorfu9FTnoQSwK4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ay/Ax+vKvdtXrdPetQw83gSjk7Ugf0EWg99U0XTUSXU=;
	b=g5H0iDIhD62wbt7xZ58aOquwHGMXagTmt9jtJaZ5lyVQFA4iLW2WaRAswBZS+62F
	zfHfVj/cs1PHDBIN+oeq0VbxA7iyLuHTzQQwG/rEiifOhsR2fDZFCIAI/DWt0SuBlHz
	EpR9oydCd+mnwP5qWG792TGY5fwhz0Uq90r/NeaA=
Content-Type: multipart/mixed; boundary="===============5271352982351639227=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xdpyinfo,xeyes: upgrading to 1.4.0,1.3.1 SUCCEEDED
Message-ID: <01010198add73025-c44edf63-3cf2-4792-8a98-0aae4b1354c5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221887

--===============5271352982351639227==
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
From c5fc91884cba9435adc93eefb68eac88f7e01e8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 07:08:41 +0000
Subject: [PATCH] xdpyinfo,xeyes: upgrade 1.3.4 -> 1.4.0,1.3.0 -> 1.3.1

---
 .../xorg-app/xdpyinfo/disable-xkb.patch       | 18 +++++++++++----
 .../{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb}  |  2 +-
 .../{xeyes_1.3.0.bb => xeyes_1.3.1.bb}        | 23 +++++++++++++++++--
 3 files changed, 35 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb} (88%)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.3.0.bb => xeyes_1.3.1.bb} (29%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
index 1e8199cc66..aa1cc270d4 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
@@ -1,10 +1,18 @@
+From 7b6400bb4682edda43561a0f2ab692e9d05f0ebb Mon Sep 17 00:00:00 2001
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


--===============5271352982351639227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xdpyinfo: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xdpyinfo-1.3.4.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xdpyinfo-1.4.0.tar.xz file://disable-xkb.patch"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGSIZE changed from 85936 to 86440 (+1%)
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-dbg: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-dev: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-dev: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-doc: PKGSIZE changed from 2876 to 3064 (+7%)
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-doc: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-doc: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-locale: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-locale: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-src: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-src: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-staticdev: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo-staticdev: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo: PV changed from "1.3.4" to "1.4.0"
packages/core2-64-poky-linux/xdpyinfo/xdpyinfo: PKGV changed from 1.3.4 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes: SRC_URI changed from "https://www.x.org/releases//individual/app/xeyes-1.3.0.tar.xz" to "https://www.x.org/releases//individual/app/xeyes-1.3.1.tar.xz"
packages/core2-64-poky-linux/xeyes/xeyes-dbg: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes-dev: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes-doc: PKGSIZE changed from 1864 to 1885 (+1%)
packages/core2-64-poky-linux/xeyes/xeyes-doc: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes-locale: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes-src: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xeyes/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xeyes/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]

--===============5271352982351639227==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xdpyinfo-xeyes-upgrade-1.3.4-1.4.0-1.3.0-1.3.1.patch"

RnJvbSBjNWZjOTE4ODRjYmE5NDM1YWRjOTNlZWZiNjhlYWM4OGY3ZTAxZThlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDc6MDg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ZHB5aW5mbyx4ZXllczogdXBncmFkZSAxLjMuNCAtPiAxLjQuMCwxLjMuMCAtPiAxLjMuMQoKLS0t
CiAuLi4veG9yZy1hcHAveGRweWluZm8vZGlzYWJsZS14a2IucGF0Y2ggICAgICAgfCAxOCArKysr
KysrKysrKy0tLS0KIC4uLi97eGRweWluZm9fMS4zLjQuYmIgPT4geGRweWluZm9fMS40LjAuYmJ9
ICB8ICAyICstCiAuLi4ve3hleWVzXzEuMy4wLmJiID0+IHhleWVzXzEuMy4xLmJifSAgICAgICAg
fCAyMyArKysrKysrKysrKysrKysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBw
L3t4ZHB5aW5mb18xLjMuNC5iYiA9PiB4ZHB5aW5mb18xLjQuMC5iYn0gKDg4JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hleWVzXzEuMy4wLmJiID0+IHhleWVzXzEu
My4xLmJifSAoMjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFw
cC94ZHB5aW5mby9kaXNhYmxlLXhrYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94ZHB5aW5mby9kaXNhYmxlLXhrYi5wYXRjaAppbmRleCAxZTgxOTljYzY2Li5hYTFjYzI3
MGQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWluZm8v
ZGlzYWJsZS14a2IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hk
cHlpbmZvL2Rpc2FibGUteGtiLnBhdGNoCkBAIC0xLDEwICsxLDE4IEBACitGcm9tIDdiNjQwMGJi
NDY4MmVkZGE0MzU2MWEwZjJhYjY5MmU5ZDA1ZjBlYmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBDaHJpcyBMYXJzb24gPGtlcmdvdGhAb3BlbmVkaGFuZC5jb20+CitEYXRlOiBUdWUs
IDE1IEF1ZyAyMDA2IDExOjU4OjM3ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIE51bWVyb3VzIG5l
dyB4b3JnIHBhY2thZ2UgdmVyc2lvbnMgZnJvbSB1cHN0cmVhbSBPRS4gIFBlc3RlcgorCiBVcHN0
cmVhbS1TdGF0dXM6IFBlbmRpbmcKKy0tLQorIGNvbmZpZ3VyZS5hYyB8IDQgKysrKworIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAotSW5kZXg6IHhkcHlpbmZvLTEuMy4wL2NvbmZp
Z3VyZS5hYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIHhkcHlpbmZvLTEuMy4wLm9yaWcvY29uZmlndXJlLmFj
CTIwMTEtMTAtMjEgMjE6MzQ6MjEuMDAwMDAwMDAwIC0wNzAwCi0rKysgeGRweWluZm8tMS4zLjAv
Y29uZmlndXJlLmFjCTIwMTEtMTEtMjggMjA6MDY6NTYuNTU0MDU2OTM1IC0wODAwCi1AQCAtNDcs
MTEgKzQ3LDE1IEBACitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitp
bmRleCA5ZDAzZThiLi5lZWYzNjliIDEwMDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9j
b25maWd1cmUuYWMKK0BAIC00OSwxMSArNDksMTUgQEAgUEtHX0NIRUNLX01PRFVMRVMoRFBZX1hF
WFQsIHhleHQsCiAgCUFDX0NIRUNLX0hFQURFUlMoW1gxMS9leHRlbnNpb25zL211bHRpYnVmLmgg
WDExL2V4dGVuc2lvbnMvWFNobS5oXSwsLFsjaW5jbHVkZSA8WDExL1hsaWIuaD5dKQogIAlDUFBG
TEFHUz0iJFNBVkVfQ1BQRkxBR1MiXSxbZWNobyAibm90IGZvdW5kIl0pCiAgCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWluZm9fMS4zLjQuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWluZm9fMS40LjAuYmIKc2ltaWxhcml0eSBp
bmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hkcHlp
bmZvXzEuMy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRw
eWluZm9fMS40LjAuYmIKaW5kZXggM2JlY2Q0MDI4MS4uODA0YjI4NDM1MiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hkcHlpbmZvXzEuMy40LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mb18xLjQuMC5iYgpAQCAtMTUsNiAr
MTUsNiBAQCBQRSA9ICIxIgogU1JDX1VSSSArPSAiZmlsZTovL2Rpc2FibGUteGtiLnBhdGNoIgog
CiBTUkNfVVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhOGFkYTU4MWRiZDcy
NjY0NDBkN2MzNzk0ZmE4OWVkZjZiOTliODg1N2ZjMmU4YzMxMDQyNjg0ZjNhZjQ4MjJiIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImRjMWRlNmU2ZTA5MWVkNDZjNDgzN2IwYWU5ODExZTgxODJmN2Jl
MGQyYWY2MzhjYWIzZTUzMGZmMDgxYTQ4YjYiCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUt
eGtiIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVzXzEu
My4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVzXzEuMy4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggMjklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94ZXllc18xLjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hleWVzXzEuMy4xLmJiCmluZGV4IDNkMWE3MDYzZWEuLjFkZWQ2ZDhlMTYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXllc18xLjMuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV5ZXNfMS4zLjEuYmIKQEAgLTEsMyArMSwy
MiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAg
LTEsNCArMSw1IEBACisjICBDb3B5cmlnaHQgKGMpIDE5OTEgIFggQ29uc29ydGl1bQorIyArQ29w
eXJpZ2h0IChjKSAyMDIzICBxM2sKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRl
ZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nCisjICBhIGNvcHkgb2Yg
dGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKKyMg
CisjCisKIHJlcXVpcmUgeG9yZy1hcHAtY29tbW9uLmluYwogCiBTVU1NQVJZID0gIlgxMSBleWVz
IHRoYXQgZm9sbG93IHRoZSBtb3VzZSBjdXJzb3IgZGVtbyIKQEAgLTYsOSArMjUsOSBAQCBmb2xs
b3cgdGhlIGxvY2F0aW9uIG9mIHRoZSBtb3VzZSBjdXJzb3IgYXJvdW5kIHRoZSBzY3JlZW4uIgog
CiBQRSA9ICIxIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zZWE1
MWIzNjUwNTFhYzMyZDE4MTNhN2RiYWE0YmZjNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTI5Mjc3MDk0ZGExZWYwNjQ2ZDU2MzRhNzljYjBjMWM1IgogCiBTUkNfVVJJ
X0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOTUwYzYwMGJmMzM0NDdlMTY5YTUz
OWVlNjY1NWVmOWYzNmQ2Y2ViZjJjMWJlNjdmN2FiNTVkYWNiNzUzMDIzIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjU2MDhkNzZiN2IxYWFjNWVkN2YyMmYxYjZiNWFkNzRlZjk4Yzg2OTMyMjBmMzJi
NGI4N2RjY2VlNGE5NTZlYWEiCiAKIERFUEVORFMgKz0gImxpYnhhdSBsaWJ4dCBsaWJ4ZXh0IGxp
YnhtdSBsaWJ4cmVuZGVyIGxpYnhpIgotLSAKMi40Ny4xCgo=

--===============5271352982351639227==--

