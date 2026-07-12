Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76582C44511
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9634.1783837890864990252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lJo/qUtP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bgh/aJXk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f550614f6-a8783fcc-a552-48fd-a8c6-5e205a1fe843-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837889;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=e66lQzXwqiS39IZN6Otjl1saIgoOF4vTsgeteoKBQ+M=;
	b=lJo/qUtP0ffazcJx/JR6azQMczZTrwZmPCxVhFGYv5kxUKAbke01PBFatOHtygS7
	sJFoLCWIUSUKrXOd0d4+ov7OALYkYUw7XudeXHAWgKjBAkqkUxaDD1vofoIxqkE7yOe
	LvrAOymtas9YFJ1XQtGltGeTkx6XDbqmE0p9nNGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837889;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=e66lQzXwqiS39IZN6Otjl1saIgoOF4vTsgeteoKBQ+M=;
	b=bgh/aJXkJtpZ6MBzu+Ty5aIvLknF+cPADxIctni6QplxG5kv4lJhzUTxq8WBrJSS
	+H+Nb1peg+Bs/8a7x6abbW//pQwx6MnCKZ9iJzAcBRvrRTMFLc6VOWqrURg6qdtrNZ5
	kg5rIZ2cGLdn10V7zeYTJ6/8J4CKl7qoIjO5wA6k=
Content-Type: multipart/mixed; boundary="===============8765668249490208289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xvinfo,xset: upgrading to 1.1.6,1.2.6 SUCCEEDED
Message-ID: <0101019f550614f6-a8783fcc-a552-48fd-a8c6-5e205a1fe843-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240753

--===============8765668249490208289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xvinfo,xset* to *1.1.6,1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xvinfo-xset-upgrade-1.1.5-1.1.6-1.2.5-1.2.6.patch
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
From f5dc76ff4f357b457a4f9713b2fdfde1e24e4660 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 05:24:44 +0000
Subject: [PATCH] xvinfo,xset: upgrade 1.1.5 -> 1.1.6,1.2.5 -> 1.2.6

---
 .../xorg-app/xset/disable-xkb.patch           |  5 ++--
 .../xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb} | 23 +++++++++++++++++--
 .../{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb}      |  2 +-
 3 files changed, 24 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb} (35%)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index 0bb05a3b88..a7476450a4 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -1,4 +1,4 @@
-From 3090dcafac7c8080091b5e3e3720209c65251a1a Mon Sep 17 00:00:00 2001
+From db7c9021b1853d5654e4ecfcfa31187afc845604 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Mon, 22 May 2006 22:15:57 +0000
 Subject: [PATCH] add "-disable-xkb" option
@@ -6,13 +6,12 @@ Subject: [PATCH] add "-disable-xkb" option
 Upstream-Status: Pending
 
 Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
-
 ---
  configure.ac | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e7c2bdf..8e1ed5e 100644
+index e578bfe..1847258 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -52,11 +52,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.5.bb b/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
similarity index 35%
rename from meta/recipes-graphics/xorg-app/xset_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.6.bb
index 398530f342..9966377ecc 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
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
+# @@ -1,3 +1,5 @@
+# +SPDX-License-Identifier: MIT-open-group
+# +
+#  Copyright 1985, 1988, 1998  The Open Group
+#  
+#  Permission to use, copy, modify, distribute, and sell this software and its
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "Utility for setting various user preference options of the display"
@@ -6,7 +25,7 @@ DESCRIPTION = "xset is a utility that is used to set various user \
 preference options of the display."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bea81cc9827cdf1af0e12c2b8228cf8d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=373a2cff5a5e58e7ccff069e0ce9fe74"
 DEPENDS += "libxext libxmu libxau"
 PE = "1"
 
@@ -14,7 +33,7 @@ SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "9f692d55635b3862cd63633b1222a87680ec283c7a8e8ed6dd698a3147f75e2f"
+SRC_URI[sha256sum] = "623837349ea887bc003f01ee2e4b6b8ddd9c2774f632c6d70eead1b56306b695"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"
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
-- 
2.47.1


--===============8765668249490208289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGSIZE changed from 771 to 924 (+20%)

--===============8765668249490208289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xvinfo-xset-upgrade-1.1.5-1.1.6-1.2.5-1.2.6.patch"

RnJvbSBmNWRjNzZmZjRmMzU3YjQ1N2E0Zjk3MTNiMmZkZmRlMWUyNGU0NjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDU6MjQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
dmluZm8seHNldDogdXBncmFkZSAxLjEuNSAtPiAxLjEuNiwxLjIuNSAtPiAxLjIuNgoKLS0tCiAu
Li4veG9yZy1hcHAveHNldC9kaXNhYmxlLXhrYi5wYXRjaCAgICAgICAgICAgfCAgNSArKy0tCiAu
Li4veG9yZy1hcHAve3hzZXRfMS4yLjUuYmIgPT4geHNldF8xLjIuNi5iYn0gfCAyMyArKysrKysr
KysrKysrKysrKy0tCiAuLi4ve3h2aW5mb18xLjEuNS5iYiA9PiB4dmluZm9fMS4xLjYuYmJ9ICAg
ICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97eHNldF8xLjIuNS5i
YiA9PiB4c2V0XzEuMi42LmJifSAoMzUlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC97eHZpbmZvXzEuMS41LmJiID0+IHh2aW5mb18xLjEuNi5iYn0gKDgwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHNldC9kaXNhYmxlLXhrYi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rpc2FibGUteGtiLnBh
dGNoCmluZGV4IDBiYjA1YTNiODguLmE3NDc2NDUwYTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rpc2FibGUteGtiLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rpc2FibGUteGtiLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAzMDkwZGNhZmFjN2M4MDgwMDkxYjVlM2UzNzIwMjA5YzY1MjUxYTFhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYjdjOTAyMWIxODUzZDU2NTRlNGVjZmNmYTMxMTg3
YWZjODQ1NjA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmRAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBNb24sIDIyIE1heSAyMDA2IDIyOjE1OjU3
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZCAiLWRpc2FibGUteGtiIiBvcHRpb24KQEAgLTYs
MTMgKzYsMTIgQEAgU3ViamVjdDogW1BBVENIXSBhZGQgIi1kaXNhYmxlLXhrYiIgb3B0aW9uCiBV
cHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogUmViYXNlIGZvciAxLjIuMSBieTogWXUgS2UgPGtl
Lnl1QGludGVsLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmFjIHwgNCArKysrCiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCBlN2MyYmRmLi44ZTFlZDVlIDEwMDY0NAoraW5kZXggZTU3OGJmZS4u
MTg0NzI1OCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBA
QCAtNTIsMTEgKzUyLDE1IEBAIFBLR19DSEVDS19NT0RVTEVTKFNFVF9YRVhULCB4ZXh0LApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRfMS4yLjUuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHNldF8xLjIuNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDM1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHNldF8x
LjIuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRfMS4y
LjYuYmIKaW5kZXggMzk4NTMwZjM0Mi4uOTk2NjM3N2VjYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRfMS4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3hzZXRfMS4yLjYuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMyArMSw1IEBACisj
ICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlULW9wZW4tZ3JvdXAKKyMgKworIyAgQ29weXJp
Z2h0IDE5ODUsIDE5ODgsIDE5OTggIFRoZSBPcGVuIEdyb3VwCisjICAKKyMgIFBlcm1pc3Npb24g
dG8gdXNlLCBjb3B5LCBtb2RpZnksIGRpc3RyaWJ1dGUsIGFuZCBzZWxsIHRoaXMgc29mdHdhcmUg
YW5kIGl0cworIyAKKyMKKwogcmVxdWlyZSB4b3JnLWFwcC1jb21tb24uaW5jCiAKIFNVTU1BUlkg
PSAiVXRpbGl0eSBmb3Igc2V0dGluZyB2YXJpb3VzIHVzZXIgcHJlZmVyZW5jZSBvcHRpb25zIG9m
IHRoZSBkaXNwbGF5IgpAQCAtNiw3ICsyNSw3IEBAIERFU0NSSVBUSU9OID0gInhzZXQgaXMgYSB1
dGlsaXR5IHRoYXQgaXMgdXNlZCB0byBzZXQgdmFyaW91cyB1c2VyIFwKIHByZWZlcmVuY2Ugb3B0
aW9ucyBvZiB0aGUgZGlzcGxheS4iCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YmVhODFjYzk4MjdjZGYxYWYwZTEyYzJiODIyOGNmOGQi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zNzNhMmNmZjVhNWU1OGU3
Y2NmZjA2OWUwY2U5ZmU3NCIKIERFUEVORFMgKz0gImxpYnhleHQgbGlieG11IGxpYnhhdSIKIFBF
ID0gIjEiCiAKQEAgLTE0LDcgKzMzLDcgQEAgU1JDX1VSSSArPSAiZmlsZTovL2Rpc2FibGUteGti
LnBhdGNoIgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlm
NjkyZDU1NjM1YjM4NjJjZDYzNjMzYjEyMjJhODc2ODBlYzI4M2M3YThlOGVkNmRkNjk4YTMxNDdm
NzVlMmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjIzODM3MzQ5ZWE4ODdiYzAwM2YwMWVlMmU0
YjZiOGRkZDljMjc3NGY2MzJjNmQ3MGVlYWQxYjU2MzA2YjY5NSIKIAogQ0ZMQUdTICs9ICItRF9H
TlVfU09VUkNFIgogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS14a2IgLS13aXRob3V0LWZvbnRj
YWNoZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94dmluZm9f
MS4xLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHZpbmZvXzEuMS42LmJi
CnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94dmluZm9fMS4xLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94dmluZm9fMS4xLjYuYmIKaW5kZXggZDdlNWQ5MTdlZi4uNzVmOWIyNmE4NSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3h2aW5mb18xLjEuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHZpbmZvXzEuMS42LmJiCkBAIC0x
MSw0ICsxMSw0IEBAIERFUEVORFMgKz0gIiBsaWJ4diIKIFBFID0gIjEiCiAKIFNSQ19VUklfRVhU
ID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNlZGU3MWVjYjI2ZDk2MTRjY2JjNjkxNjcy
MDI4NWU5NWEyYzdlMGM1ZTE5Yjg1NzBlYWFmNzJhZDdjNWM0MDQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTQzNjk0NWU2YTRhYjcwNTkwMzU4ZWVjMmI4NWQyNjk3MGY3ZGU0ODBkMjdlOGEyNWFm
OGZlODQyMWU4OGFlMiIKLS0gCjIuNDcuMQoK

--===============8765668249490208289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xset: SRC_URI changed from "https://www.x.org/releases//individual/app/xset-1.2.5.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xset-1.2.6.tar.xz file://disable-xkb.patch"
packages/x86-64-v3-poky-linux/xset: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-dbg: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-dbg: PKGSIZE changed from 70376 to 70536 (+0%)
packages/x86-64-v3-poky-linux/xset/xset-dev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-doc: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-doc: PKGSIZE changed from 12665 to 13426 (+6%)
packages/x86-64-v3-poky-linux/xset/xset-locale: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-src: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-src: PKGSIZE changed from 46441 to 46632 (+0%)
packages/x86-64-v3-poky-linux/xset/xset-src: FILELIST: directory renamed /usr/src/debug/xset/1.2.5 -> /usr/src/debug/xset/1.2.6
packages/x86-64-v3-poky-linux/xset/xset-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xvinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xvinfo-1.1.5.tar.xz" to "https://www.x.org/releases//individual/app/xvinfo-1.1.6.tar.xz"
packages/x86-64-v3-poky-linux/xvinfo: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dbg: PKGSIZE changed from 36760 to 37232 (+1%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-dev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-doc: PKGSIZE changed from 771 to 924 (+20%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-locale: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-locale: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: PKGSIZE changed from 13191 to 13579 (+3%)
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-src: FILELIST: directory renamed /usr/src/debug/xvinfo/1.1.5 -> /usr/src/debug/xvinfo/1.1.6
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-staticdev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo-staticdev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/xvinfo/xvinfo: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/xvinfo/xvinfo: PKGV changed from 1.1.5 [default] to 1.1.6 [default]

--===============8765668249490208289==--

