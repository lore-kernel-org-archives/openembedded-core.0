Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C53EEB582
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102962.1767267468928181330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vhu0nDqB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cE23jsf8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b79598381-212ea236-ac67-40e1-8c2a-93f086ce9f8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P5wJEKGewE2dZHiYP4xK1nyVNWBwKLcNDtFS7Kf9HJc=;
	b=vhu0nDqBA6lZsQfUT4qVAeDbOUi3gxysyib+v9DDfpxAdmVuSWGl8ajBGBrjCpL/
	nrpQG7VleBhx6ZYLQAu487M721zM/psLWlU7Y5Hx3l4SiZtvRUk/EfH/hqvguANS7XO
	wx+XmsGFyHrLAer75JsxYFGz0z/acgDcVjss4nmE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P5wJEKGewE2dZHiYP4xK1nyVNWBwKLcNDtFS7Kf9HJc=;
	b=cE23jsf8RNAXcydJv1Sx847LBsIaD6H9GMOWf+NySWWBcd6fPRnDfCMQr0mOdFPH
	pRoPrFKvMeW1WfDTGmf9vFq2ZrhgBkAQaVWdHSseeh2V52fqTZltYCQ4txixkTKxW0b
	5AiNeYRttvj4z/qae3myEIlWXoq41she2qSeIFqU=
Content-Type: multipart/mixed; boundary="===============7725721901288261389=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xauth,rgb: upgrading to 1.1.5,1.1.1 SUCCEEDED
Message-ID: <0101019b79598381-212ea236-ac67-40e1-8c2a-93f086ce9f8f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228757

--===============7725721901288261389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xauth,rgb* to *1.1.5,1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xauth-rgb-upgrade-1.1.4-1.1.5-1.1.0-1.1.1.patch
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
From ac94915e392d134572832195df10ae7a81b9fc3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 05:41:05 +0000
Subject: [PATCH] xauth,rgb: upgrade 1.1.4 -> 1.1.5,1.1.0 -> 1.1.1

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


--===============7725721901288261389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rgb: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb: SRC_URI changed from "https://www.x.org/releases//individual/app/rgb-1.1.0.tar.xz" to "https://www.x.org/releases//individual/app/rgb-1.1.1.tar.xz"
packages/x86-64-v3-poky-linux/rgb: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-dbg: PKGSIZE changed from 17592 to 18232 (+4%)
packages/x86-64-v3-poky-linux/rgb/rgb-dev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-dev: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-doc: PKGSIZE changed from 1769 to 1778 (+1%)
packages/x86-64-v3-poky-linux/rgb/rgb-locale: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-locale: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-src: FILELIST: directory renamed /usr/src/debug/rgb/1.1.0 -> /usr/src/debug/rgb/1.1.1
packages/x86-64-v3-poky-linux/rgb/rgb-src: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-src: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb-src: PKGSIZE changed from 4198 to 4531 (+8%)
packages/x86-64-v3-poky-linux/rgb/rgb-staticdev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb-staticdev: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/rgb/rgb: PV changed from "1.1.0" to "1.1.1"
packages/x86-64-v3-poky-linux/rgb/rgb: PKGSIZE changed from 32351 to 32156 (-1%)
packages/x86-64-v3-poky-linux/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.4.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.5.tar.xz"
packages/x86-64-v3-poky-linux/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 118720 to 119328 (+1%)
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGSIZE changed from 11403 to 12018 (+5%)
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-src: FILELIST: directory renamed /usr/src/debug/xauth/1.1.4 -> /usr/src/debug/xauth/1.1.5
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-src: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGSIZE changed from 76373 to 76741 (+0%)
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth: PV changed from "1.1.4" to "1.1.5"

--===============7725721901288261389==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xauth-rgb-upgrade-1.1.4-1.1.5-1.1.0-1.1.1.patch"

RnJvbSBhYzk0OTE1ZTM5MmQxMzQ1NzI4MzIxOTVkZjEwYWU3YTgxYjlmYzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNTo0MTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhh
dXRoLHJnYjogdXBncmFkZSAxLjEuNCAtPiAxLjEuNSwxLjEuMCAtPiAxLjEuMQoKLS0tCiAuLi4v
eG9yZy1hcHAve3JnYl8xLjEuMC5iYiA9PiByZ2JfMS4xLjEuYmJ9ICAgfCAyNiArKysrKysrKysr
KysrKysrKy0tCiAuLi4ve3hhdXRoXzEuMS40LmJiID0+IHhhdXRoXzEuMS41LmJifSAgICAgICAg
fCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97cmdiXzEuMS4wLmJiID0+
IHJnYl8xLjEuMS5iYn0gKDI5JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAve3hhdXRoXzEuMS40LmJiID0+IHhhdXRoXzEuMS41LmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9yZ2JfMS4xLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAvcmdiXzEuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMjklCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9yZ2JfMS4xLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9yZ2JfMS4xLjEuYmIKaW5kZXgg
ZjE0ZGE3ZmQyMS4uZDI2YzlkMmYwOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctYXBwL3JnYl8xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAvcmdiXzEuMS4xLmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBD
T1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0yMiw3ICsyMiw3IEBACisjICBvdGhlciBkZWFs
aW5ncyBpbiB0aGlzIFNvZnR3YXJlIHdpdGhvdXQgcHJpb3Igd3JpdHRlbiBhdXRob3JpemF0aW9u
CisjICBmcm9tIFRoZSBPcGVuIEdyb3VwLgorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDE5OTQsIDIw
MDgsIE9yYWNsZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisj
ICtDb3B5cmlnaHQgKGMpIDE5OTQsIDIwMDgsIE9yYWNsZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMu
CisjICAKKyMgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0
byBhbnkgcGVyc29uIG9idGFpbmluZyBhCisjICBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFz
c29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorIyAKKyMKKwog
cmVxdWlyZSB4b3JnLWFwcC1jb21tb24uaW5jCiAKIFNVTU1BUlkgPSAiWDExIGNvbG9yIG5hbWUg
ZGF0YWJhc2UiCkBAIC03LDEwICsyOSwxMCBAQCBsb29rdXAsIHRoZSByZ2IgcHJvZ3JhbSB0byBj
b252ZXJ0IHRoZSB0ZXh0IGZpbGUgaW50byB0aGUgYmluYXJ5IGRhdGFiYXNlIFwKIGZvcm1hdC4i
CiAKIERFUEVORFMgKz0gIiB4b3JncHJvdG8gdXRpbC1tYWNyb3MiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lZjU5OGFkYmUyNDFiZDBiMGI5MTEzODMxZjZlMjQ5YSIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWRjNGYyM2RiMDQ3NzNhNDE0
ZTNjMzljYzk3YTlmNDE1IgogUEUgPSAiMSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZmMwM2Q3ZjU2ZTViMmE2MTc2NjgxNjdmODkyNzk0OGNjZTU0ZjkzMDk3
ZTdjY2Q5ZjA1NjA3N2Y0NzllZDM3YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjODBmZjI4MGEw
MmY1NmMzMGZhZGMyZGZhMjEwZmM2OTc5YzRhYjk2OGFmYTMxNTI3OGNiOTc3NjhiNjRlY2FiIgog
CiBGSUxFUzoke1BOfSArPSAiJHtkYXRhZGlyfS9YMTEiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveGF1dGhfMS4xLjUuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS40LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjUuYmIKaW5kZXggOTE5
NDU3YmNhNi4uODY2MGQxN2ZmMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctYXBwL3hhdXRoXzEuMS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFw
cC94YXV0aF8xLjEuNS5iYgpAQCAtOSw3ICs5LDcgQEAgREVQRU5EUyArPSAibGlieGF1IGxpYnhl
eHQgbGlieG11IgogUEUgPSAiMSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZTkzMTgxNDE0NjRhZDdiNGRjMGY4NTY0YTU4MGYwZDIwZjk3N2M4NWEzODhjYzQw
ZDVhNzY2MjA2MTUxYzY5MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNDAwMGUyZjQ0MWZhY2Vi
ZjU2OTAyNmJlZGVjYzIzYmEyNjJjYzY5MjdiZTUyMDcwYWJlMDAwMjYyNWNmYmUwIgogCiBQQUNL
QUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2
NicsIGQpfSIKIFBBQ0tBR0VDT05GSUdbaXB2Nl0gPSAiLS1lbmFibGUtaXB2NiwtLWRpc2FibGUt
aXB2NiwiCi0tIAoyLjQ3LjEKCg==

--===============7725721901288261389==--

