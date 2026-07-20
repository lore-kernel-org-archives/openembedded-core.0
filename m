Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57C9C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:25:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2633.1784525118547056716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ENN3zVUI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mLrOD8Zx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f7dfc592c-cabf4175-d4a3-440e-89a6-2dd3cec05f1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784525117;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=sCNeWKXZf2Trmpg+hgpu80af2ZCcHWOBhcsIB+vN5eM=;
	b=ENN3zVUIg/pFqHH61X7GPy313kL6KF/2wVkJyRpLEcDKF9LTMaxkhZOgAyU4w1gU
	T1cszvG6kyMJ/9g9BZ4NaJGXhW/rgGIRyyQYuHUSXg4JDHVpznD3NqE17is3bElu8+T
	/mYo2QW4pY7OTWiUlzcQTUNBxC6p7fcqIOqJV0bQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784525117;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=sCNeWKXZf2Trmpg+hgpu80af2ZCcHWOBhcsIB+vN5eM=;
	b=mLrOD8Zxj7wnkkBTD0mfqHnzb6oxD9jvNBhVb1g0cNOFs+qU2NnmMU6mhV2v2NNd
	Xf7dWSItOIWOFSUmhq9BXEY35neo3hyde+4nFLSoXMh6DHv1LV3UkeitSkraIDp3Fpo
	9abmD7VLrvDXFYkgb8QhzlDVrL8alciov074qlpI=
Content-Type: multipart/mixed; boundary="===============0865086913650232666=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwininfo,xvinfo,xmodmap: upgrading to 1.1.7,1.1.6,1.0.12
 SUCCEEDED
Message-ID: <0101019f7dfc592c-cabf4175-d4a3-440e-89a6-2dd3cec05f1b-000000@us-west-2.amazonses.com>
Date: Mon, 20 Jul 2026 05:25:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241317

--===============0865086913650232666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwininfo,xvinfo,xmodmap* to *1.1.7,1.1.6,1.0.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwininfo-xvinfo-xmodmap-upgrade-1.1.6-1.1.7-1.1.5-1..patch
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
From f807f0b000b527d2ef41ddadadfa7ff446be4d0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 20 Jul 2026 05:10:10 +0000
Subject: [PATCH] xwininfo,xvinfo,xmodmap: upgrade 1.1.6 -> 1.1.7,1.1.5 ->
 1.1.6,1.0.11 -> 1.0.12

---
 .../{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb}  | 23 +++++++++++++++++--
 .../{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb}      |  2 +-
 .../{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb}  |  2 +-
 3 files changed, 23 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb} (34%)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
similarity index 34%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
index dc955aa977..aac5b9bebe 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
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
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 1987, 2010, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 1987, 2025, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "Utility for modifying keymaps and pointer button mappings in X"
@@ -9,9 +28,9 @@ from the user's session startup script to configure the keyboard \
 according to personal tastes."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76caa89655fe179dbb374831c98ca65f"
 
 PE = "1"
-SRC_URI[sha256sum] = "9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81"
+SRC_URI[sha256sum] = "fc54b9b5bbf2ae58ba8f9d42bd051c41c7438377400c42c17d7496d19e1bb3ce"
 
 SRC_URI_EXT = "xz"
diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
index d7e5d917ef..75f9b26a85 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
@@ -11,4 +11,4 @@ DEPENDS += " libxv"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404"
+SRC_URI[sha256sum] = "a436945e6a4ab70590358eec2b85d26970f7de480d27e8a25af8fe8421e88ae2"
diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
index d410f7d519..6fc49e8729 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
@@ -12,4 +12,4 @@ DEPENDS += "libxext libxmu gettext-native"
 PE = "0"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
+SRC_URI[sha256sum] = "bee14d594cc86cc59aae1015c1b452a71bf60c304131e2716ca1cf0df733b4ac"
-- 
2.47.1


--===============0865086913650232666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xmodmap: SRC_URI changed from "https://www.x.org/releases//individual/app/xmodmap-1.0.11.tar.xz" to "https://www.x.org/releases//individual/app/xmodmap-1.0.12.tar.xz"
packages/x86-64-v3-poky-linux/xmodmap: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-dbg: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-dbg: PKGSIZE changed from 109544 to 109720 (+0%)
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-dbg: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-dev: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-dev: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-doc: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-doc: PKGSIZE changed from 12632 to 12892 (+2%)
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-doc: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-locale: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-locale: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-src: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-src: PKGSIZE changed from 60980 to 60857 (-0%)
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-src: FILELIST: directory renamed /usr/src/debug/xmodmap/1.0.11 -> /usr/src/debug/xmodmap/1.0.12
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-src: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-staticdev: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap-staticdev: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xmodmap/xmodmap: PV changed from "1.0.11" to "1.0.12"
packages/x86-64-v3-poky-linux/xmodmap/xmodmap: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/x86-64-v3-poky-linux/xvinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xvinfo-1.1.5.tar.xz" to "https://www.x.org/releases//individual/app/xvinfo-1.1.6.tar.xz"
packages/x86-64-v3-poky-linux/xvinfo: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PKGSIZE changed from 36760 to 37232 (+1%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGSIZE changed from 771 to 924 (+20%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-locale: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-locale: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PKGSIZE changed from 13191 to 13579 (+3%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: FILELIST: directory renamed /usr/src/debug/xvinfo/1.1.5 -> /usr/src/debug/xvinfo/1.1.6
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-staticdev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-staticdev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xwininfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xwininfo-1.1.6.tar.xz" to "https://www.x.org/releases//individual/app/xwininfo-1.1.7.tar.xz"
packages/x86-64-v3-poky-linux/xwininfo: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-dbg: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-dbg: PKGSIZE changed from 148880 to 148984 (+0%)
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-dbg: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-dev: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-dev: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-doc: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-doc: PKGSIZE changed from 7320 to 7432 (+2%)
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-doc: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-locale: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-locale: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-src: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-src: PKGSIZE changed from 89673 to 89874 (+0%)
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-src: FILELIST: directory renamed /usr/src/debug/xwininfo/1.1.6 -> /usr/src/debug/xwininfo/1.1.7
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-src: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-staticdev: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo-staticdev: PKGV changed from 1.1.6 [default] to 1.1.7 [default]
packages/x86-64-v3-poky-linux/xwininfo/xwininfo: PV changed from "1.1.6" to "1.1.7"
packages/x86-64-v3-poky-linux/xwininfo/xwininfo: PKGV changed from 1.1.6 [default] to 1.1.7 [default]

--===============0865086913650232666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGSIZE changed from 771 to 924 (+20%)

--===============0865086913650232666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwininfo-xvinfo-xmodmap-upgrade-1.1.6-1.1.7-1.1.5-1..patch"

RnJvbSBmODA3ZjBiMDAwYjUyN2QyZWY0MWRkYWRhZGZhN2ZmNDQ2YmU0ZDBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjAgSnVsIDIwMjYgMDU6MTA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2luaW5mbyx4dmluZm8seG1vZG1hcDogdXBncmFkZSAxLjEuNiAtPiAxLjEuNywxLjEuNSAtPgog
MS4xLjYsMS4wLjExIC0+IDEuMC4xMgoKLS0tCiAuLi4ve3htb2RtYXBfMS4wLjExLmJiID0+IHht
b2RtYXBfMS4wLjEyLmJifSAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiAuLi4ve3h2aW5mb18x
LjEuNS5iYiA9PiB4dmluZm9fMS4xLjYuYmJ9ICAgICAgfCAgMiArLQogLi4uL3t4d2luaW5mb18x
LjEuNi5iYiA9PiB4d2luaW5mb18xLjEuNy5iYn0gIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1hcHAve3htb2RtYXBfMS4wLjExLmJiID0+IHhtb2RtYXBfMS4wLjEyLmJifSAo
MzQlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97eHZpbmZvXzEuMS41
LmJiID0+IHh2aW5mb18xLjEuNi5iYn0gKDgwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAve3h3aW5pbmZvXzEuMS42LmJiID0+IHh3aW5pbmZvXzEuMS43LmJifSAoODEl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94bW9kbWFwXzEu
MC4xMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94bW9kbWFwXzEuMC4xMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDM0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAveG1vZG1hcF8xLjAuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC94bW9kbWFwXzEuMC4xMi5iYgppbmRleCBkYzk1NWFhOTc3Li5hYWM1YjliZWJl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveG1vZG1hcF8xLjAu
MTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3htb2RtYXBfMS4wLjEy
LmJiCkBAIC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsr
KyBDT1BZSU5HCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAxOTg3LCAyMDEw
LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAr
Q29weXJpZ2h0IChjKSAxOTg3LCAyMDI1LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgor
IyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8g
YW55IHBlcnNvbiBvYnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3Nv
Y2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyMgCisjCisKIHJl
cXVpcmUgeG9yZy1hcHAtY29tbW9uLmluYwogCiBTVU1NQVJZID0gIlV0aWxpdHkgZm9yIG1vZGlm
eWluZyBrZXltYXBzIGFuZCBwb2ludGVyIGJ1dHRvbiBtYXBwaW5ncyBpbiBYIgpAQCAtOSw5ICsy
OCw5IEBAIGZyb20gdGhlIHVzZXIncyBzZXNzaW9uIHN0YXJ0dXAgc2NyaXB0IHRvIGNvbmZpZ3Vy
ZSB0aGUga2V5Ym9hcmQgXAogYWNjb3JkaW5nIHRvIHBlcnNvbmFsIHRhc3Rlcy4iCiAKIExJQ0VO
U0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MjcyYzE3
ZTk2MzcwZTFlNzQ3NzNmYTIyZDk5ODk2MjEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT03NmNhYTg5NjU1ZmUxNzlkYmIzNzQ4MzFjOThjYTY1ZiIKIAogUEUgPSAiMSIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YTJmODE2OGY3YjBiYzM4MjgyODg0NzQwMzkwMmNiNmJm
MTc1ZTE3NjU4YjM2MTg5ZWFjODdlZGRhODc3ZTgxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZj
NTRiOWI1YmJmMmFlNThiYThmOWQ0MmJkMDUxYzQxYzc0MzgzNzc0MDBjNDJjMTdkNzQ5NmQxOWUx
YmIzY2UiCiAKIFNSQ19VUklfRVhUID0gInh6IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3h2aW5mb18xLjEuNS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94dmluZm9fMS4xLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h2aW5mb18xLjEuNS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h2aW5mb18xLjEuNi5iYgppbmRleCBkN2U1
ZDkxN2VmLi43NWY5YjI2YTg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAveHZpbmZvXzEuMS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFw
cC94dmluZm9fMS4xLjYuYmIKQEAgLTExLDQgKzExLDQgQEAgREVQRU5EUyArPSAiIGxpYnh2Igog
UEUgPSAiMSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Vk
ZTcxZWNiMjZkOTYxNGNjYmM2OTE2NzIwMjg1ZTk1YTJjN2UwYzVlMTliODU3MGVhYWY3MmFkN2M1
YzQwNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNDM2OTQ1ZTZhNGFiNzA1OTAzNThlZWMyYjg1
ZDI2OTcwZjdkZTQ4MGQyN2U4YTI1YWY4ZmU4NDIxZTg4YWUyIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h3aW5pbmZvXzEuMS42LmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL3h3aW5pbmZvXzEuMS43LmJiCnNpbWlsYXJpdHkgaW5kZXggODEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94d2luaW5mb18xLjEu
Ni5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h3aW5pbmZvXzEu
MS43LmJiCmluZGV4IGQ0MTBmN2Q1MTkuLjZmYzQ5ZTg3MjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC94d2luaW5mb18xLjEuNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAveHdpbmluZm9fMS4xLjcuYmIKQEAgLTEyLDQgKzEyLDQgQEAg
REVQRU5EUyArPSAibGlieGV4dCBsaWJ4bXUgZ2V0dGV4dC1uYXRpdmUiCiBQRSA9ICIwIgogCiBT
UkNfVVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzNTE4ODk3YzE3NDQ4ZGY5
YmE5OWFkNmQ5YmIxY2EwZjE3YmMwZWQ3YzBmZDYxMjgxYjM0Y2VlZDI5YTkyNTNmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJlZTE0ZDU5NGNjODZjYzU5YWFlMTAxNWMxYjQ1MmE3MWJmNjBjMzA0
MTMxZTI3MTZjYTFjZjBkZjczM2I0YWMiCi0tIAoyLjQ3LjEKCg==

--===============0865086913650232666==--

