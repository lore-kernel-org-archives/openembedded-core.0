Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C1DCCF2E7
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28431.1792389780057093308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DMoSTiRQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pKC6jSZF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a152c18e3f-6d9293a1-a208-4040-9d65-9d94b4a31214-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389779;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=YBnJ+8A56ObrJv4k6YSfq4Mt5zWakOsUx6EIKtP+BYY=;
	b=DMoSTiRQwcvN4/nu4PYRauPhrFbUNHAlWOlKgM3RDzopN9ee+ilEoifBIAaAWT5O
	Tl1aJCqGXXGuQJ8DPPIlJxxwRImbx9opzE6sfhh4QrehYNgy3ESwNQCjNYJRrOLoHqv
	xjDoDeJ0Z6mStUeHkE7VI2BBwImU3Yzr2bsvW4i8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389779;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=YBnJ+8A56ObrJv4k6YSfq4Mt5zWakOsUx6EIKtP+BYY=;
	b=pKC6jSZFegFLrys86P0TNZViMpfAptVCxHk09J3ltfo9pjfrkcKDSHrFFayXb5Ea
	dxTUmtyplSlbUUDIcxidhBdOk0/WgFsJzVHYJHjkbzVLzkOdcRpSixmYvYLfeVm6hPN
	LCcLCwXrcDokuUfvFkE9/w9gf3xoVLFipWCchYOo=
Content-Type: multipart/mixed; boundary="===============5492641681339221127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libunistring: upgrading to 1.5 SUCCEEDED
Message-ID: <010101a152c18e3f-6d9293a1-a208-4040-9d65-9d94b4a31214-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248129

--===============5492641681339221127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libunistring* to *1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libunistring-upgrade-1.4.2-1.5.patch
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
From 23def70879d613b9b2956bb7f72b758134efc842 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 06:02:48 +0000
Subject: [PATCH] libunistring: upgrade 1.4.2 -> 1.5

Prepare for 1.5 release.
build: In MSVC builds, use 'rc' instead of 'windres'.
Improve copyright statement in the Windows .rc file.
Update to Unicode version 18.0.0.
INSTALL.windows: Fix MSVC instructions.
build: Fix "make installcheck" failure in --disable-shared builds.
Add an LLM policy.
Upgrade to libtool 2.6.2.
---
 ...unistring_1.4.2.bb => libunistring_1.5.bb} | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_1.4.2.bb => libunistring_1.5.bb} (48%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.4.2.bb b/meta/recipes-support/libunistring/libunistring_1.5.bb
similarity index 48%
rename from meta/recipes-support/libunistring/libunistring_1.4.2.bb
rename to meta/recipes-support/libunistring/libunistring_1.5.bb
index d3bfe976c9..27ea092ed9 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.2.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.5.bb
@@ -1,3 +1,34 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- doc/libunistring.texi
+# +++ doc/libunistring.texi
+# @@ -110,7 +110,7 @@
+#  
+#  @ignore
+#  @c This was: @copying but it triggers a makeinfo 4.13 bug
+# -Copyright (C) 2001-2025 Free Software Foundation, Inc.
+# +Copyright (C) 2001-2026 Free Software Foundation, Inc.
+#  
+#  This manual is free documentation.  It is dually licensed under the
+#  GNU FDL and the GNU GPL.  This means that you can redistribute this
+# @@ -141,7 +141,7 @@
+#  @page
+#  @vskip 0pt plus 1filll
+#  @c @insertcopying
+# -Copyright (C) 2001-2025 Free Software Foundation, Inc.
+# +Copyright (C) 2001-2026 Free Software Foundation, Inc.
+#  
+#  This manual is free documentation.  It is dually licensed under the
+#  GNU FDL and the GNU GPL.  This means that you can redistribute this
+# 
+#
+
 SUMMARY = "Library for manipulating C and Unicode strings"
 
 DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
@@ -16,12 +47,12 @@ SECTION = "devel"
 LICENSE = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
-                    file://doc/libunistring.texi;md5=55cc91e1fe09c7aec78b6dc932202300 \
+                    file://doc/libunistring.texi;md5=573f97c426e271415838c2d6e688d1b6 \
                     "
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8"
+SRC_URI[sha256sum] = "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af407ae3383c9d81"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============5492641681339221127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libunistring/libunistring: FILELIST: removed "/usr/lib/libunistring.so.5.2.1", added "/usr/lib/libunistring.so.5.2.2"
Changes to packages/x86-64-v3-poky-linux/libunistring (sysroot):
  /usr/lib/libunistring.so.5 changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so.5.2.1 moved to /usr/lib/libunistring.so.5.2.2
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libunistring-native (sysroot):
  /usr/lib/libunistring.so.5 changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so.5.2.1 moved to /usr/lib/libunistring.so.5.2.2

--===============5492641681339221127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libunistring-upgrade-1.4.2-1.5.patch"

RnJvbSAyM2RlZjcwODc5ZDYxM2I5YjI5NTZiYjdmNzJiNzU4MTM0ZWZjODQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDY6MDI6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1bmlzdHJpbmc6IHVwZ3JhZGUgMS40LjIgLT4gMS41CgpQcmVwYXJlIGZvciAxLjUgcmVsZWFz
ZS4KYnVpbGQ6IEluIE1TVkMgYnVpbGRzLCB1c2UgJ3JjJyBpbnN0ZWFkIG9mICd3aW5kcmVzJy4K
SW1wcm92ZSBjb3B5cmlnaHQgc3RhdGVtZW50IGluIHRoZSBXaW5kb3dzIC5yYyBmaWxlLgpVcGRh
dGUgdG8gVW5pY29kZSB2ZXJzaW9uIDE4LjAuMC4KSU5TVEFMTC53aW5kb3dzOiBGaXggTVNWQyBp
bnN0cnVjdGlvbnMuCmJ1aWxkOiBGaXggIm1ha2UgaW5zdGFsbGNoZWNrIiBmYWlsdXJlIGluIC0t
ZGlzYWJsZS1zaGFyZWQgYnVpbGRzLgpBZGQgYW4gTExNIHBvbGljeS4KVXBncmFkZSB0byBsaWJ0
b29sIDIuNi4yLgotLS0KIC4uLnVuaXN0cmluZ18xLjQuMi5iYiA9PiBsaWJ1bmlzdHJpbmdfMS41
LmJifSB8IDM1ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVu
aXN0cmluZy97bGlidW5pc3RyaW5nXzEuNC4yLmJiID0+IGxpYnVuaXN0cmluZ18xLjUuYmJ9ICg0
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW5pc3RyaW5nL2xpYnVu
aXN0cmluZ18xLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVuaXN0cmluZy9saWJ1
bmlzdHJpbmdfMS41LmJiCnNpbWlsYXJpdHkgaW5kZXggNDglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnVuaXN0cmluZy9saWJ1bmlzdHJpbmdfMS40LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVuaXN0cmluZy9saWJ1bmlzdHJpbmdfMS41LmJiCmlu
ZGV4IGQzYmZlOTc2YzkuLjI3ZWEwOTJlZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYnVuaXN0cmluZy9saWJ1bmlzdHJpbmdfMS40LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlidW5pc3RyaW5nL2xpYnVuaXN0cmluZ18xLjUuYmIKQEAgLTEsMyArMSwzNCBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIGRvYy9saWJ1bmlzdHJpbmcudGV4aQorIyArKysgZG9j
L2xpYnVuaXN0cmluZy50ZXhpCisjIEBAIC0xMTAsNyArMTEwLDcgQEAKKyMgIAorIyAgQGlnbm9y
ZQorIyAgQGMgVGhpcyB3YXM6IEBjb3B5aW5nIGJ1dCBpdCB0cmlnZ2VycyBhIG1ha2VpbmZvIDQu
MTMgYnVnCisjIC1Db3B5cmlnaHQgKEMpIDIwMDEtMjAyNSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4KKyMgK0NvcHlyaWdodCAoQykgMjAwMS0yMDI2IEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLgorIyAgCisjICBUaGlzIG1hbnVhbCBpcyBmcmVlIGRvY3VtZW50YXRpb24uICBJ
dCBpcyBkdWFsbHkgbGljZW5zZWQgdW5kZXIgdGhlCisjICBHTlUgRkRMIGFuZCB0aGUgR05VIEdQ
TC4gIFRoaXMgbWVhbnMgdGhhdCB5b3UgY2FuIHJlZGlzdHJpYnV0ZSB0aGlzCisjIEBAIC0xNDEs
NyArMTQxLDcgQEAKKyMgIEBwYWdlCisjICBAdnNraXAgMHB0IHBsdXMgMWZpbGxsCisjICBAYyBA
aW5zZXJ0Y29weWluZworIyAtQ29weXJpZ2h0IChDKSAyMDAxLTIwMjUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLCBJbmMuCisjICtDb3B5cmlnaHQgKEMpIDIwMDEtMjAyNiBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24sIEluYy4KKyMgIAorIyAgVGhpcyBtYW51YWwgaXMgZnJlZSBkb2N1bWVudGF0
aW9uLiAgSXQgaXMgZHVhbGx5IGxpY2Vuc2VkIHVuZGVyIHRoZQorIyAgR05VIEZETCBhbmQgdGhl
IEdOVSBHUEwuICBUaGlzIG1lYW5zIHRoYXQgeW91IGNhbiByZWRpc3RyaWJ1dGUgdGhpcworIyAK
KyMKKwogU1VNTUFSWSA9ICJMaWJyYXJ5IGZvciBtYW5pcHVsYXRpbmcgQyBhbmQgVW5pY29kZSBz
dHJpbmdzIgogCiBERVNDUklQVElPTiA9ICJUZXh0IGZpbGVzIGFyZSBub3dhZGF5cyB1c3VhbGx5
IGVuY29kZWQgaW4gVW5pY29kZSwgYW5kIG1heVwKQEAgLTE2LDEyICs0NywxMiBAQCBTRUNUSU9O
ID0gImRldmVsIgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIE9SIExHUEwtMy4wLW9yLWxh
dGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PTZhNmE4ZTAy
MDgzOGIyMzQwNmM4MWIxOWMxZDQ2ZGY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL1JF
QURNRTtiZWdpbmxpbmU9NDU7ZW5kbGluZT02NTttZDU9M2E4OTZhOTQzYjRkYTJjNTUxZTZiZTFh
ZjI3ZWZmOGQgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZG9jL2xpYnVuaXN0cmluZy50
ZXhpO21kNT01NWNjOTFlMWZlMDljN2FlYzc4YjZkYzkzMjIwMjMwMCBcCisgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9kb2MvbGlidW5pc3RyaW5nLnRleGk7bWQ1PTU3M2Y5N2M0MjZlMjcxNDE1
ODM4YzJkNmU2ODhkMWI2IFwKICAgICAgICAgICAgICAgICAgICAgIgogREVQRU5EUyA9ICJncGVy
Zi1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9saWJ1bmlzdHJpbmcvbGlidW5p
c3RyaW5nLSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlODI2NjRiMTcwMDY0
ZTYyMzMxOTYyMTI2YjI1OWQ0NTJkNTNiMjI3YmI0YTkzYWIyMDA0MGQ4NDZmZWMwMWQ4IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjViMGVjZDQ2Y2JmMjI1Mzc1ZjIwYWI0MDU2MTk3ZTY2YTdhYzU5
MGUyNjg0YzA2OWFmNDA3YWUzMzgzYzlkODEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHRleGluZm8K
IEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============5492641681339221127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libunistring: SRC_URI changed from "https://ftpmirror.gnu.org//libunistring/libunistring-1.4.2.tar.gz" to "https://ftpmirror.gnu.org//libunistring/libunistring-1.5.tar.gz"
packages/x86-64-v3-poky-linux/libunistring: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-dbg: PKGSIZE changed from 3592408 to 3639448 (+1%)
packages/x86-64-v3-poky-linux/libunistring/libunistring-dbg: FILELIST: removed "/usr/lib/.debug/libunistring.so.5.2.1", added "/usr/lib/.debug/libunistring.so.5.2.2"
packages/x86-64-v3-poky-linux/libunistring/libunistring-dbg: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-dbg: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-dev: PKGSIZE changed from 198078 to 198871 (+0%)
packages/x86-64-v3-poky-linux/libunistring/libunistring-dev: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-dev: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-doc: PKGSIZE changed from 950084 to 951359 (+0%)
packages/x86-64-v3-poky-linux/libunistring/libunistring-doc: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-doc: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-locale: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-locale: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-src: PKGSIZE changed from 10559299 to 10802886 (+2%)
packages/x86-64-v3-poky-linux/libunistring/libunistring-src: FILELIST: directory renamed /usr/src/debug/libunistring/1.4.2/lib/unimetadata -> /usr/src/debug/libunistring/1.5/lib/unimetadata, directory renamed /usr/src/debug/libunistring/1.4.2/lib/glthread -> /usr/src/debug/libunistring/1.5/lib/glthread, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unistdio -> /usr/src/debug/libunistring/1.5/lib/unistdio, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unigbrk -> /usr/src/debug/libunistring/1.5/lib/unigbrk, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unicase -> /usr/src/debug/libunistring/1.5/lib/unicase, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unistr -> /usr/src/debug/libunistring/1.5/lib/unistr, directory renamed /usr/src/debug/libunistring/1.4.2/lib/uniwidth -> /usr/src/debug/libunistring/1.5/lib/uniwidth, directory renamed /usr/src/debug/libunistring/1.4.2/lib/uniname -> /usr/src/debug/libunistring/1.5/lib/uniname, directory renamed /
 usr/src/debug/libunistring/1.4.2/lib/unistring -> /usr/src/debug/libunistring/1.5/lib/unistring, directory renamed /usr/src/debug/libunistring/1.4.2/lib/uniconv -> /usr/src/debug/libunistring/1.5/lib/uniconv, directory renamed /usr/src/debug/libunistring/1.4.2/lib/uniwbrk -> /usr/src/debug/libunistring/1.5/lib/uniwbrk, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unictype -> /usr/src/debug/libunistring/1.5/lib/unictype, directory renamed /usr/src/debug/libunistring/1.4.2/lib/unilbrk -> /usr/src/debug/libunistring/1.5/lib/unilbrk, directory renamed /usr/src/debug/libunistring/1.4.2/lib/uninorm -> /usr/src/debug/libunistring/1.5/lib/uninorm, removed "/usr/src/debug/libunistring/1.4.2/lib/idx.h /usr/src/debug/libunistring/1.4.2/lib/memchr.c /usr/src/debug/libunistring/1.4.2/lib/mbrtowc.c /usr/src/debug/libunistring/1.4.2/lib/uniwidth.h /usr/src/debug/libunistring/1.4.2/lib/mbszero.c /usr/src/debug/libunistring/1.4.2/lib/iconveh.h /usr/src/debug/libunistring/1.4.2/lib/vasnpri
 ntf.c /usr/src/debug/libunistring/1.4.2/lib/strstr.c /usr/src/debug/libunistring/1.4.2/lib/localename.c /usr/src/debug/libunistring/1.4.2/lib/c-strcaseeq.h /usr/src/debug/libunistring/1.4.2/lib/localename.h /usr/src/debug/libunistring/1.4.2/lib/printf-frexpl.c /usr/src/debug/libunistring/1.4.2/lib/c32isgraph.c /usr/src/debug/libunistring/1.4.2/lib/c32islower.c /usr/src/debug/libunistring/1.4.2/lib/c32isprint.c /usr/src/debug/libunistring/1.4.2/lib/c32ispunct.c /usr/src/debug/libunistring/1.4.2/lib/c32iscntrl.c /usr/src/debug/libunistring/1.4.2/lib/c32isalnum.c /usr/src/debug/libunistring/1.4.2/lib/c32isspace.c /usr/src/debug/libunistring/1.4.2/lib/c32isupper.c /usr/src/debug/libunistring/1.4.2/lib/c32isdigit.c /usr/src/debug/libunistring/1.4.2/lib/string.h /usr/src/debug/libunistring/1.4.2/lib/string.c /usr/src/debug/libunistring/1.4.2/lib/amemxfrm.h /usr/src/debug/libunistring/1.4.2/lib/amemxfrm.c /usr/src/debug/libunistring/1.4.2/lib/unistdio.h /usr/src/debug/libunistring/1.4.2/li
 b/malloca.c /usr/src/debug/libunistring/1.4.2/lib/setlocale_null-unlocked.c /usr/src/debug/libunistring/1.4.2/lib/localename-table.c /usr/src/debug/libunistring/1.4.2/lib/malloca.h /usr/src/debug/libunistring/1.4.2/lib/setlocale_null.h /usr/src/debug/libunistring/1.4.2/lib/printf-args.c /usr/src/debug/libunistring/1.4.2/lib/stdlib.h /usr/src/debug/libunistring/1.4.2/lib/mbsnlen.c /usr/src/debug/libunistring/1.4.2/lib/setlocale_null.c /usr/src/debug/libunistring/1.4.2/lib/unimetadata.h /usr/src/debug/libunistring/1.4.2/lib/stdlib.c /usr/src/debug/libunistring/1.4.2/lib/printf-args.h /usr/src/debug/libunistring/1.4.2/lib/streq-opt.h /usr/src/debug/libunistring/1.4.2/lib/c-strcasecmp.c /usr/src/debug/libunistring/1.4.2/lib/fpucw.h /usr/src/debug/libunistring/1.4.2/lib/uniconv.h /usr/src/debug/libunistring/1.4.2/lib/unitypes.h /usr/src/debug/libunistring/1.4.2/lib/c32to-impl.h /usr/src/debug/libunistring/1.4.2/lib/unistd.c /usr/src/debug/libunistring/1.4.2/lib/c32tolower.c /usr/src/debu
 g/libunistring/1.4.2/lib/uchar.h /usr/src/debug/libunistring/1.4.2/lib/wchar.h /usr/src/debug/libunistring/1.4.2/lib/c-strcase.h /usr/src/debug/libunistring/1.4.2/lib/xsize.c /usr/src/debug/libunistring/1.4.2/lib/unistr.h /usr/src/debug/libunistring/1.4.2/lib/xsize.h /usr/src/debug/libunistring/1.4.2/lib/c32isxdigit.c /usr/src/debug/libunistring/1.4.2/lib/memcmp2.c /usr/src/debug/libunistring/1.4.2/lib/memcmp2.h /usr/src/debug/libunistring/1.4.2/lib/c32isblank.c /usr/src/debug/libunistring/1.4.2/lib/wcsstr-impl.h /usr/src/debug/libunistring/1.4.2/lib/hard-locale.c /usr/src/debug/libunistring/1.4.2/lib/hard-locale.h /usr/src/debug/libunistring/1.4.2/lib/wctype-h.c /usr/src/debug/libunistring/1.4.2/lib/uniwbrk.h /usr/src/debug/libunistring/1.4.2/lib/printf-parse.h /usr/src/debug/libunistring/1.4.2/lib/printf-parse.c /usr/src/debug/libunistring/1.4.2/lib/str-two-way.h /usr/src/debug/libunistring/1.4.2/lib/localename-environ.c /usr/src/debug/libunistring/1.4.2/lib/mbchar.c /usr/src/debu
 g/libunistring/1.4.2/lib/striconveha.h /usr/src/debug/libunistring/1.4.2/lib/striconveha.c /usr/src/debug/libunistring/1.4.2/lib/mbchar.h /usr/src/debug/libunistring/1.4.2/lib/c32width.c /usr/src/debug/libunistring/1.4.2/lib/unilbrk.h /usr/src/debug/libunistring/1.4.2/lib/getlocalename_l-unsafe.h /usr/src/debug/libunistring/1.4.2/lib/struniq.h /usr/src/debug/libunistring/1.4.2/lib/getlocalename_l-unsafe.c /usr/src/debug/libunistring/1.4.2/lib/version.c /usr/src/debug/libunistring/1.4.2/lib/math.c /usr/src/debug/libunistring/1.4.2/lib/c-ctype.h /usr/src/debug/libunistring/1.4.2/lib/uninorm.h /usr/src/debug/libunistring/1.4.2/lib/c-ctype.c /usr/src/debug/libunistring/1.4.2/lib/localename-unsafe.c /usr/src/debug/libunistring/1.4.2/lib/striconveh.h /usr/src/debug/libunistring/1.4.2/lib/wcs-two-way.h /usr/src/debug/libunistring/1.4.2/lib/striconveh.c /usr/src/debug/libunistring/1.4.2/lib/unicase.h /usr/src/debug/libunistring/1.4.2/lib/localcharset.c /usr/src/debug/libunistring/1.4.2/lib/
 mbiterf.c /usr/src/debug/libunistring/1.4.2/lib/mbiterf.h /usr/src/debug/libunistring/1.4.2/lib/localcharset.h /usr/src/debug/libunistring/1.4.2/lib/printf-frexp.c /usr/src/debug/libunistring/1.4.2/lib/mbrtoc32.c /usr/src/debug/libunistring/1.4.2/lib/fseterr.h /usr/src/debug/libunistring/1.4.2/lib/unictype.h /usr/src/debug/libunistring/1.4.2/lib/c32is-impl.h /usr/src/debug/libunistring/1.4.2/lib/unigbrk.h /usr/src/debug/libunistring/1.4.2/lib/c32isalpha.c /usr/src/debug/libunistring/1.4.2/lib/array-mergesort.h /usr/src/debug/libunistring/1.4.2/lib/fseterr.c", added "/usr/src/debug/libunistring/1.5/lib/stdlib.h /usr/src/debug/libunistring/1.5/lib/stdlib.c /usr/src/debug/libunistring/1.5/lib/strnul.c /usr/src/debug/libunistring/1.5/lib/str-two-way.h /usr/src/debug/libunistring/1.5/lib/wcs-two-way.h /usr/src/debug/libunistring/1.5/lib/c32islower.c /usr/src/debug/libunistring/1.5/lib/idx.h /usr/src/debug/libunistring/1.5/lib/c32isalnum.c /usr/src/debug/libunistring/1.5/lib/mbchar.c /usr
 /src/debug/libunistring/1.5/lib/array-mergesort.h /usr/src/debug/libunistring/1.5/lib/mbchar.h /usr/src/debug/libunistring/1.5/lib/unicase.h /usr/src/debug/libunistring/1.5/lib/c32isprint.c /usr/src/debug/libunistring/1.5/lib/c32isdigit.c /usr/src/debug/libunistring/1.5/lib/c-ctype.c /usr/src/debug/libunistring/1.5/lib/printf-frexp.c /usr/src/debug/libunistring/1.5/lib/printf-parse.c /usr/src/debug/libunistring/1.5/lib/struniq.h /usr/src/debug/libunistring/1.5/lib/c-ctype.h /usr/src/debug/libunistring/1.5/lib/c32is-impl.h /usr/src/debug/libunistring/1.5/lib/string.h /usr/src/debug/libunistring/1.5/lib/printf-parse.h /usr/src/debug/libunistring/1.5/lib/c32width.c /usr/src/debug/libunistring/1.5/lib/uniwidth.h /usr/src/debug/libunistring/1.5/lib/c32isgraph.c /usr/src/debug/libunistring/1.5/lib/mbrtowc.c /usr/src/debug/libunistring/1.5/lib/malloca.c /usr/src/debug/libunistring/1.5/lib/mbiter-aux.c /usr/src/debug/libunistring/1.5/lib/c-strcaseeq.h /usr/src/debug/libunistring/1.5/lib/ver
 sion.c /usr/src/debug/libunistring/1.5/lib/mbrtoc32.c /usr/src/debug/libunistring/1.5/lib/malloca.h /usr/src/debug/libunistring/1.5/lib/c-strcase.h /usr/src/debug/libunistring/1.5/lib/mbiter-aux.h /usr/src/debug/libunistring/1.5/lib/c-strcasecmp.c /usr/src/debug/libunistring/1.5/lib/printf-frexpl.c /usr/src/debug/libunistring/1.5/lib/mbiterf.h /usr/src/debug/libunistring/1.5/lib/mbiterf.c /usr/src/debug/libunistring/1.5/lib/localename-table.c /usr/src/debug/libunistring/1.5/lib/streq-opt.h /usr/src/debug/libunistring/1.5/lib/c32isupper.c /usr/src/debug/libunistring/1.5/lib/fpucw.h /usr/src/debug/libunistring/1.5/lib/c32isalpha.c /usr/src/debug/libunistring/1.5/lib/striconveha.h /usr/src/debug/libunistring/1.5/lib/striconveha.c /usr/src/debug/libunistring/1.5/lib/c32ispunct.c /usr/src/debug/libunistring/1.5/lib/unistdio.h /usr/src/debug/libunistring/1.5/lib/memchr.c /usr/src/debug/libunistring/1.5/lib/getlocalename_l-unsafe.h /usr/src/debug/libunistring/1.5/lib/printf-args.h /usr/src
 /debug/libunistring/1.5/lib/wcsstr-impl.h /usr/src/debug/libunistring/1.5/lib/c32isspace.c /usr/src/debug/libunistring/1.5/lib/printf-args.c /usr/src/debug/libunistring/1.5/lib/getlocalename_l-unsafe.c /usr/src/debug/libunistring/1.5/lib/localename-environ.c /usr/src/debug/libunistring/1.5/lib/uninorm.h /usr/src/debug/libunistring/1.5/lib/mbsnlen.c /usr/src/debug/libunistring/1.5/lib/memeq.c /usr/src/debug/libunistring/1.5/lib/streq.c /usr/src/debug/libunistring/1.5/lib/localename-unsafe.c /usr/src/debug/libunistring/1.5/lib/xsize.c /usr/src/debug/libunistring/1.5/lib/setlocale_null-unlocked.c /usr/src/debug/libunistring/1.5/lib/stdbit.h /usr/src/debug/libunistring/1.5/lib/xsize.h /usr/src/debug/libunistring/1.5/lib/striconveh.h /usr/src/debug/libunistring/1.5/lib/mbszero.c /usr/src/debug/libunistring/1.5/lib/striconveh.c /usr/src/debug/libunistring/1.5/lib/strstr.c /usr/src/debug/libunistring/1.5/lib/thread-optim.c /usr/src/debug/libunistring/1.5/lib/setlocale_null.h /usr/src/debug
 /libunistring/1.5/lib/unistr.h /usr/src/debug/libunistring/1.5/lib/setlocale_null.c /usr/src/debug/libunistring/1.5/lib/unitypes.h /usr/src/debug/libunistring/1.5/lib/vasnprintf.c /usr/src/debug/libunistring/1.5/lib/localcharset.h /usr/src/debug/libunistring/1.5/lib/c32tolower.c /usr/src/debug/libunistring/1.5/lib/localcharset.c /usr/src/debug/libunistring/1.5/lib/c32isblank.c /usr/src/debug/libunistring/1.5/lib/unimetadata.h /usr/src/debug/libunistring/1.5/lib/unistd.c /usr/src/debug/libunistring/1.5/lib/hard-locale.h /usr/src/debug/libunistring/1.5/lib/unigbrk.h /usr/src/debug/libunistring/1.5/lib/hard-locale.c /usr/src/debug/libunistring/1.5/lib/unilbrk.h /usr/src/debug/libunistring/1.5/lib/uniwbrk.h /usr/src/debug/libunistring/1.5/lib/amemxfrm.h /usr/src/debug/libunistring/1.5/lib/fseterr.c /usr/src/debug/libunistring/1.5/lib/c32to-impl.h /usr/src/debug/libunistring/1.5/lib/fseterr.h /usr/src/debug/libunistring/1.5/lib/amemxfrm.c /usr/src/debug/libunistring/1.5/lib/iconveh.h /us
 r/src/debug/libunistring/1.5/lib/uchar.h /usr/src/debug/libunistring/1.5/lib/wchar.h /usr/src/debug/libunistring/1.5/lib/stdc_rotate_left.c /usr/src/debug/libunistring/1.5/lib/wctype-h.c /usr/src/debug/libunistring/1.5/lib/c32iscntrl.c /usr/src/debug/libunistring/1.5/lib/memcmp2.h /usr/src/debug/libunistring/1.5/lib/memcmp2.c /usr/src/debug/libunistring/1.5/lib/math.c /usr/src/debug/libunistring/1.5/lib/uniconv.h /usr/src/debug/libunistring/1.5/lib/c32isxdigit.c /usr/src/debug/libunistring/1.5/lib/localename.h /usr/src/debug/libunistring/1.5/lib/unictype.h /usr/src/debug/libunistring/1.5/lib/localename.c"
packages/x86-64-v3-poky-linux/libunistring/libunistring-src: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-src: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring-staticdev: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring-staticdev: PV changed from "1.4.2" to "1.5"
packages/x86-64-v3-poky-linux/libunistring/libunistring: PKGSIZE changed from 2062461 to 2103421 (+2%)
packages/x86-64-v3-poky-linux/libunistring/libunistring: FILELIST: removed "/usr/lib/libunistring.so.5.2.1", added "/usr/lib/libunistring.so.5.2.2"
packages/x86-64-v3-poky-linux/libunistring/libunistring: PKGV changed from 1.4.2 [default] to 1.5 [default]
packages/x86-64-v3-poky-linux/libunistring/libunistring: PV changed from "1.4.2" to "1.5"
Changes to packages/x86-64-v3-poky-linux/libunistring (sysroot):
  /usr/lib/libunistring.so.5 changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so.5.2.1 moved to /usr/lib/libunistring.so.5.2.2
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libunistring-native (sysroot):
  /usr/lib/libunistring.so.5 changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so changed symlink target from libunistring.so.5.2.1 to libunistring.so.5.2.2
  /usr/lib/libunistring.so.5.2.1 moved to /usr/lib/libunistring.so.5.2.2

--===============5492641681339221127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libunistring-changelog.txt"

Prepare for 1.5 release.
build: In MSVC builds, use 'rc' instead of 'windres'.
Improve copyright statement in the Windows .rc file.
Update to Unicode version 18.0.0.
INSTALL.windows: Fix MSVC instructions.
build: Fix "make installcheck" failure in --disable-shared builds.
Add an LLM policy.
Upgrade to libtool 2.6.2.

--===============5492641681339221127==--

