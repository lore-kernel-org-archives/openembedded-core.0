Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D85D47CB8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1426.1768526740384283148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZMxqCHER;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=i0BbQ8A9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc468828f-e5e572e3-9f9e-4469-a137-89c8166aea83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zqik7K8ivmux8vEIZYDxMk8lLOiVQDD7RlgcMSUQuqY=;
	b=ZMxqCHERjRG+YK2uLUdrTzU4BHZk4eor8EEjqGXMasGTmF3Eww6ZsEto7K1C8w7+
	FvfzuDLSLhVrTF3DyNHZ6c29dvv+oTjJLl1RA/tgrWNcfVcDELACi1ojpy1U2fal/gI
	TfOCgZTDqV3xPJhhv+UMtd94PF4dxdCp6slFVYXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zqik7K8ivmux8vEIZYDxMk8lLOiVQDD7RlgcMSUQuqY=;
	b=i0BbQ8A99ZEo4naY2zdu2jVjhUiV1K8y4t6nCDUpkvWKeUpRUde3rjic4qpMhCK+
	DQXDWzWDCounyhgQRZl4PdeRbJokwAe7Aq3vb5tEMvKNTITT3rCXF3LXu07fWp9b+bk
	oddHAB5U0NHo0i4YZGxYT2hCJuua1sQx0AQw/VK8=
Content-Type: multipart/mixed; boundary="===============8182688126668539609=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] rgb,xauth: upgrading to 1.1.1,1.1.5 SUCCEEDED
Message-ID: <0101019bc468828f-e5e572e3-9f9e-4469-a137-89c8166aea83-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229447

--===============8182688126668539609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rgb,xauth* to *1.1.1,1.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rgb-xauth-upgrade-1.1.0-1.1.1-1.1.4-1.1.5.patch
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
From e4d555fb580e43587ef671d8198bdbb239291105 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 19:24:12 +0000
Subject: [PATCH] rgb,xauth: upgrade 1.1.0 -> 1.1.1,1.1.4 -> 1.1.5

---
 .../xorg-app/{rgb_1.1.0.bb => rgb_1.1.1.bb}   | 26 +++++++++++++++++--
 .../{xauth_1.1.4.bb => xauth_1.1.5.bb}        |  2 +-
 2 files changed, 25 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{rgb_1.1.0.bb => rgb_1.1.1.bb} (29%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb b/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
similarity index 29%
rename from meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
rename to meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
index f14da7fd21..d26c9d2f09 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
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
+# @@ -22,7 +22,7 @@
+#  other dealings in this Software without prior written authorization
+#  from The Open Group.
+#  
+# -Copyright (c) 1994, 2008, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 1994, 2008, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "X11 color name database"
@@ -7,10 +29,10 @@ lookup, the rgb program to convert the text file into the binary database \
 format."
 
 DEPENDS += " xorgproto util-macros"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc4f23db04773a414e3c39cc97a9f415"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b"
+SRC_URI[sha256sum] = "c80ff280a02f56c30fadc2dfa210fc6979c4ab968afa315278cb97768b64ecab"
 
 FILES:${PN} += "${datadir}/X11"
diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
index 919457bca6..8660d17ff0 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
+SRC_URI[sha256sum] = "a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============8182688126668539609==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rgb-xauth-upgrade-1.1.0-1.1.1-1.1.4-1.1.5.patch"

RnJvbSBlNGQ1NTVmYjU4MGU0MzU4N2VmNjcxZDgxOThiZGJiMjM5MjkxMTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMTk6MjQ6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
Z2IseGF1dGg6IHVwZ3JhZGUgMS4xLjAgLT4gMS4xLjEsMS4xLjQgLT4gMS4xLjUKCi0tLQogLi4u
L3hvcmctYXBwL3tyZ2JfMS4xLjAuYmIgPT4gcmdiXzEuMS4xLmJifSAgIHwgMjYgKysrKysrKysr
KysrKysrKystLQogLi4uL3t4YXV0aF8xLjEuNC5iYiA9PiB4YXV0aF8xLjEuNS5iYn0gICAgICAg
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3JnYl8xLjEuMC5iYiA9
PiByZ2JfMS4xLjEuYmJ9ICgyOSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3t4YXV0aF8xLjEuNC5iYiA9PiB4YXV0aF8xLjEuNS5iYn0gKDgzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvcmdiXzEuMS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL3JnYl8xLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDI5JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvcmdiXzEuMS4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvcmdiXzEuMS4xLmJiCmluZGV4
IGYxNGRhN2ZkMjEuLmQyNmM5ZDJmMDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC9yZ2JfMS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3JnYl8xLjEuMS5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
Q09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMjIsNyArMjIsNyBAQAorIyAgb3RoZXIgZGVh
bGluZ3MgaW4gdGhpcyBTb2Z0d2FyZSB3aXRob3V0IHByaW9yIHdyaXR0ZW4gYXV0aG9yaXphdGlv
bgorIyAgZnJvbSBUaGUgT3BlbiBHcm91cC4KKyMgIAorIyAtQ29weXJpZ2h0IChjKSAxOTk0LCAy
MDA4LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVkLgor
IyArQ29weXJpZ2h0IChjKSAxOTk0LCAyMDA4LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVz
LgorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwg
dG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBh
c3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyMgCisjCisK
IHJlcXVpcmUgeG9yZy1hcHAtY29tbW9uLmluYwogCiBTVU1NQVJZID0gIlgxMSBjb2xvciBuYW1l
IGRhdGFiYXNlIgpAQCAtNywxMCArMjksMTAgQEAgbG9va3VwLCB0aGUgcmdiIHByb2dyYW0gdG8g
Y29udmVydCB0aGUgdGV4dCBmaWxlIGludG8gdGhlIGJpbmFyeSBkYXRhYmFzZSBcCiBmb3JtYXQu
IgogCiBERVBFTkRTICs9ICIgeG9yZ3Byb3RvIHV0aWwtbWFjcm9zIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZWY1OThhZGJlMjQxYmQwYjBiOTExMzgzMWY2ZTI0OWEi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kYzRmMjNkYjA0NzczYTQx
NGUzYzM5Y2M5N2E5ZjQxNSIKIFBFID0gIjEiCiAKIFNSQ19VUklfRVhUID0gInh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImZjMDNkN2Y1NmU1YjJhNjE3NjY4MTY3Zjg5Mjc5NDhjY2U1NGY5MzA5
N2U3Y2NkOWYwNTYwNzdmNDc5ZWQzN2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzgwZmYyODBh
MDJmNTZjMzBmYWRjMmRmYTIxMGZjNjk3OWM0YWI5NjhhZmEzMTUyNzhjYjk3NzY4YjY0ZWNhYiIK
IAogRklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0vWDExIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL3hhdXRoXzEuMS41LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS41LmJiCmluZGV4IDkx
OTQ1N2JjYTYuLjg2NjBkMTdmZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94YXV0aF8xLjEuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAveGF1dGhfMS4xLjUuYmIKQEAgLTksNyArOSw3IEBAIERFUEVORFMgKz0gImxpYnhhdSBsaWJ4
ZXh0IGxpYnhtdSIKIFBFID0gIjEiCiAKIFNSQ19VUklfRVhUID0gInh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImU5MzE4MTQxNDY0YWQ3YjRkYzBmODU2NGE1ODBmMGQyMGY5NzdjODVhMzg4Y2M0
MGQ1YTc2NjIwNjE1MWM2OTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTQwMDBlMmY0NDFmYWNl
YmY1NjkwMjZiZWRlY2MyM2JhMjYyY2M2OTI3YmU1MjA3MGFiZTAwMDI2MjVjZmJlMCIKIAogUEFD
S0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lw
djYnLCBkKX0iCiBQQUNLQUdFQ09ORklHW2lwdjZdID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxl
LWlwdjYsIgotLSAKMi40Ny4xCgo=

--===============8182688126668539609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rgb: SRC_URI changed from "https://www.x.org/releases//individual/app/rgb-1.1.0.tar.xz" to "https://www.x.org/releases//individual/app/rgb-1.1.1.tar.xz"
packages/x86-64-v3-poky-linux/rgb: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PKGSIZE changed from 17592 to 18232 (+4%)
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-dev: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-dev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PKGSIZE changed from 1769 to 1778 (+1%)
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-locale: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-locale: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-src: FILELIST: directory renamed /usr/src/debug/rgb/1.1.0 -> /usr/src/debug/rgb/1.1.1
packages/x86-64-v3-poky-linux/rgb/rgb-src: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-src: PKGSIZE changed from 4198 to 4531 (+8%)
packages/x86-64-v3-poky-linux/rgb/rgb-src: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-staticdev: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-staticdev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb: PKGSIZE changed from 32351 to 32156 (-1%)
packages/x86-64-v3-poky-linux/rgb/rgb: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.4.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.5.tar.xz"
packages/x86-64-v3-poky-linux/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 118720 to 119328 (+1%)
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGSIZE changed from 11403 to 12018 (+5%)
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-src: FILELIST: directory renamed /usr/src/debug/xauth/1.1.4 -> /usr/src/debug/xauth/1.1.5
packages/x86-64-v3-poky-linux/xauth/xauth-src: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGSIZE changed from 76373 to 76741 (+0%)
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]

--===============8182688126668539609==--

