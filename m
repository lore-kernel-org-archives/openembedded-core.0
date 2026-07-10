Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACBAC4450A
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7997.1783669767172429399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uqGfzXWb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zkjrxLko;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f4b00b799-3cb96b18-88b1-4f42-9101-cce37fdbca04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669766;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UJ9Fdw3oLCs9G1qfQWpLBix77otxYwm4d0TakQwJnoM=;
	b=uqGfzXWbLK8YlBktkj9wzb8zuz12XQB8CBfjneTe9NCwGMIoAvr9pjIyrri2LYh9
	oHWOJ5ATrDeQ1oNO4GNQ4EmUhyQu/CIFHBhlMQDxBMz7IE3EgekVRX95ZSXWsovI0y8
	Dkt9XRUpuPX5UbWH8nFcIa98fKmrjj/DeR8OryWY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669766;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UJ9Fdw3oLCs9G1qfQWpLBix77otxYwm4d0TakQwJnoM=;
	b=zkjrxLkoe6o/CIgUkeYzYMuFqe/3KHnpjLHtkoeplPEoaRdjidTMf/SlL+X6wDjH
	ItZFXSFmr4AyG/g9RvlLka/MkKHlG8IHsSOHWN9Coc5f6AY7+9YFmfDz94D4E/g5pvn
	3Lc9/Q9ihkJQ1Is0zRFvc90ShwE+a6XZJAGWldPA=
Content-Type: multipart/mixed; boundary="===============6372369649280059704=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xset: upgrading to 1.2.6 SUCCEEDED
Message-ID: <0101019f4b00b799-3cb96b18-88b1-4f42-9101-cce37fdbca04-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240603

--===============6372369649280059704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xset* to *1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xset-upgrade-1.2.5-1.2.6.patch
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
From 45abc114c2432a1cf77b497b3e618ba33b36a626 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 05:43:59 +0000
Subject: [PATCH] xset: upgrade 1.2.5 -> 1.2.6

---
 .../xorg-app/xset/disable-xkb.patch           |  5 ++--
 .../xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb} | 23 +++++++++++++++++--
 2 files changed, 23 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb} (35%)

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index 0bb05a3b88..e099623688 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -1,4 +1,4 @@
-From 3090dcafac7c8080091b5e3e3720209c65251a1a Mon Sep 17 00:00:00 2001
+From a9a90a95047a0a08bb0fd0823961ed9707f451d4 Mon Sep 17 00:00:00 2001
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
-- 
2.47.1


--===============6372369649280059704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xset: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset: SRC_URI changed from "https://www.x.org/releases//individual/app/xset-1.2.5.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xset-1.2.6.tar.xz file://disable-xkb.patch"
packages/x86-64-v3-poky-linux/xset: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-dbg: PKGSIZE changed from 70376 to 70536 (+0%)
packages/x86-64-v3-poky-linux/xset/xset-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-dbg: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-dev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-doc: PKGSIZE changed from 12665 to 13426 (+6%)
packages/x86-64-v3-poky-linux/xset/xset-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-doc: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-locale: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-src: PKGSIZE changed from 46441 to 46632 (+0%)
packages/x86-64-v3-poky-linux/xset/xset-src: FILELIST: directory renamed /usr/src/debug/xset/1.2.5 -> /usr/src/debug/xset/1.2.6
packages/x86-64-v3-poky-linux/xset/xset-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-src: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/xset/xset: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/xset/xset: PV changed from "1.2.5" to "1.2.6"

--===============6372369649280059704==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xset-upgrade-1.2.5-1.2.6.patch"

RnJvbSA0NWFiYzExNGMyNDMyYTFjZjc3YjQ5N2IzZTYxOGJhMzNiMzZhNjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDU6NDM6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2V0OiB1cGdyYWRlIDEuMi41IC0+IDEuMi42CgotLS0KIC4uLi94b3JnLWFwcC94c2V0L2Rpc2Fi
bGUteGtiLnBhdGNoICAgICAgICAgICB8ICA1ICsrLS0KIC4uLi94b3JnLWFwcC97eHNldF8xLjIu
NS5iYiA9PiB4c2V0XzEuMi42LmJifSB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hzZXRfMS4yLjUuYmIgPT4geHNldF8xLjIuNi5iYn0g
KDM1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHNldC9k
aXNhYmxlLXhrYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rp
c2FibGUteGtiLnBhdGNoCmluZGV4IDBiYjA1YTNiODguLmUwOTk2MjM2ODggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rpc2FibGUteGtiLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94c2V0L2Rpc2FibGUteGtiLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMDkwZGNhZmFjN2M4MDgwMDkxYjVlM2UzNzIwMjA5YzY1
MjUxYTFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhOWE5MGE5NTA0N2EwYTA4YmIw
ZmQwODIzOTYxZWQ5NzA3ZjQ1MWQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmRAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBNb24sIDIyIE1heSAy
MDA2IDIyOjE1OjU3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZCAiLWRpc2FibGUteGtiIiBv
cHRpb24KQEAgLTYsMTMgKzYsMTIgQEAgU3ViamVjdDogW1BBVENIXSBhZGQgIi1kaXNhYmxlLXhr
YiIgb3B0aW9uCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogUmViYXNlIGZvciAxLjIuMSBi
eTogWXUgS2UgPGtlLnl1QGludGVsLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmFjIHwgNCArKysr
CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBlN2MyYmRmLi44ZTFlZDVlIDEwMDY0NAoraW5k
ZXggZTU3OGJmZS4uMTg0NzI1OCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29u
ZmlndXJlLmFjCiBAQCAtNTIsMTEgKzUyLDE1IEBAIFBLR19DSEVDS19NT0RVTEVTKFNFVF9YRVhU
LCB4ZXh0LApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRf
MS4yLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHNldF8xLjIuNi5iYgpz
aW1pbGFyaXR5IGluZGV4IDM1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAveHNldF8xLjIuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hzZXRfMS4yLjYuYmIKaW5kZXggMzk4NTMwZjM0Mi4uOTk2NjM3N2VjYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRfMS4yLjUuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hzZXRfMS4yLjYuYmIKQEAgLTEsMyArMSwyMiBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEs
MyArMSw1IEBACisjICtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlULW9wZW4tZ3JvdXAKKyMg
KworIyAgQ29weXJpZ2h0IDE5ODUsIDE5ODgsIDE5OTggIFRoZSBPcGVuIEdyb3VwCisjICAKKyMg
IFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGRpc3RyaWJ1dGUsIGFuZCBzZWxsIHRo
aXMgc29mdHdhcmUgYW5kIGl0cworIyAKKyMKKwogcmVxdWlyZSB4b3JnLWFwcC1jb21tb24uaW5j
CiAKIFNVTU1BUlkgPSAiVXRpbGl0eSBmb3Igc2V0dGluZyB2YXJpb3VzIHVzZXIgcHJlZmVyZW5j
ZSBvcHRpb25zIG9mIHRoZSBkaXNwbGF5IgpAQCAtNiw3ICsyNSw3IEBAIERFU0NSSVBUSU9OID0g
InhzZXQgaXMgYSB1dGlsaXR5IHRoYXQgaXMgdXNlZCB0byBzZXQgdmFyaW91cyB1c2VyIFwKIHBy
ZWZlcmVuY2Ugb3B0aW9ucyBvZiB0aGUgZGlzcGxheS4iCiAKIExJQ0VOU0UgPSAiTUlUIgotTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YmVhODFjYzk4MjdjZGYxYWYwZTEy
YzJiODIyOGNmOGQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zNzNh
MmNmZjVhNWU1OGU3Y2NmZjA2OWUwY2U5ZmU3NCIKIERFUEVORFMgKz0gImxpYnhleHQgbGlieG11
IGxpYnhhdSIKIFBFID0gIjEiCiAKQEAgLTE0LDcgKzMzLDcgQEAgU1JDX1VSSSArPSAiZmlsZTov
L2Rpc2FibGUteGtiLnBhdGNoIgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjlmNjkyZDU1NjM1YjM4NjJjZDYzNjMzYjEyMjJhODc2ODBlYzI4M2M3YThlOGVk
NmRkNjk4YTMxNDdmNzVlMmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjIzODM3MzQ5ZWE4ODdi
YzAwM2YwMWVlMmU0YjZiOGRkZDljMjc3NGY2MzJjNmQ3MGVlYWQxYjU2MzA2YjY5NSIKIAogQ0ZM
QUdTICs9ICItRF9HTlVfU09VUkNFIgogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS14a2IgLS13
aXRob3V0LWZvbnRjYWNoZSIKLS0gCjIuNDcuMQoK

--===============6372369649280059704==--

