Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ECACDB470
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50432.1781195513269909905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hOz5Latp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1cVz4bcW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb7869b11-4edf4014-cde7-4299-8942-d416bae4c9f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Vp3PgozlQtwSUG5idv7zL83g7zCM1W9aU29zQnFEbw=;
	b=hOz5LatpTYKSXpRNpwJP1reTz3qP98dLVDcXP17iNMGkK8S/T7PUqmQAGqjuGNMz
	Xswcywj078B3DRAVw7Ep1jIm5H2vYDi+zgtvBAAJv+6tUthjUgcVGSwOfKc2X91T5M6
	FlNRG8QIABZLj68Ons6Gq7IHftuPpA9G+9I7o+/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Vp3PgozlQtwSUG5idv7zL83g7zCM1W9aU29zQnFEbw=;
	b=1cVz4bcWi0aGA8Z1iscQh1xYC36Rbawl1rqaeuP7jlVjNFvLDigwQ8S1Rt2qGaCw
	n7UQUIZqhdOkywnEhljQECf+rQEo9tA+DCcG/tWRyxMZdOWHE3bVer6WNFLrY3LJV3S
	9V8hq5ixzCjaMvXZ9jgRrx2r+Ks3nzQ3O1hdV+ds=
Content-Type: multipart/mixed; boundary="===============6930343940712459161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] minicom: upgrading to 2.11.1 SUCCEEDED
Message-ID: <0101019eb7869b11-4edf4014-cde7-4299-8942-d416bae4c9f3-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238519

--===============6930343940712459161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *minicom* to *2.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-minicom-upgrade-2.10-2.11.1.patch
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
From f81c0028f3f32158f6d1455c0e93967f523788a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:26:11 +0000
Subject: [PATCH] minicom: upgrade 2.10 -> 2.11.1

---
 .../{minicom_2.10.bb => minicom_2.11.1.bb}    | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/minicom/{minicom_2.10.bb => minicom_2.11.1.bb} (43%)

diff --git a/meta/recipes-extended/minicom/minicom_2.10.bb b/meta/recipes-extended/minicom/minicom_2.11.1.bb
similarity index 43%
rename from meta/recipes-extended/minicom/minicom_2.10.bb
rename to meta/recipes-extended/minicom/minicom_2.11.1.bb
index 20ce5662c2..a8660c9826 100644
--- a/meta/recipes-extended/minicom/minicom_2.10.bb
+++ b/meta/recipes-extended/minicom/minicom_2.11.1.bb
@@ -1,3 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/minicom.h
+# +++ src/minicom.h
+# @@ -1,7 +1,5 @@
+#  /*
+#   * minicom.h	Constants, defaults, globals etc.
+# - *
+# - *		$Id: minicom.h,v 1.26 2009-06-06 21:19:36 al-guest Exp $
+#   *
+#   *		This file is part of the minicom communications package,
+#   *		Copyright 1991-1995 Miquel van Smoorenburg.
+# @@ -10,3 +8,5 @@
+#   *		modify it under the terms of the GNU General Public License
+#   *		as published by the Free Software Foundation; either version
+#   *		2 of the License, or (at your option) any later version.
+# + *
+# + *  You should have received a copy of the GNU General Public License along
+# 
+#
+
 SUMMARY = "Text-based modem control and terminal emulation program"
 HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
@@ -5,11 +32,12 @@ SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
-                    file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
+                    file://src/minicom.h;beginline=1;endline=12;md5=6bee95d0996491703ede1bd26ccf2de7 \
+                    "
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538"
+SRC_URI[sha256sum] = "87cf0da91af0531357cd61b8e1906b907edd2c9ef82f9ae74c277e1893d0f98c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.47.1


--===============6930343940712459161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-minicom-upgrade-2.10-2.11.1.patch"

RnJvbSBmODFjMDAyOGYzZjMyMTU4ZjZkMTQ1NWMwZTkzOTY3ZjUyMzc4OGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MjY6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
aW5pY29tOiB1cGdyYWRlIDIuMTAgLT4gMi4xMS4xCgotLS0KIC4uLi97bWluaWNvbV8yLjEwLmJi
ID0+IG1pbmljb21fMi4xMS4xLmJifSAgICB8IDMyICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9taW5pY29tL3ttaW5pY29tXzIuMTAuYmIgPT4gbWluaWNvbV8yLjEx
LjEuYmJ9ICg0MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20v
bWluaWNvbV8yLjEwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbV8y
LjExLjEuYmIKc2ltaWxhcml0eSBpbmRleCA0MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL21pbmljb20vbWluaWNvbV8yLjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbWluaWNvbS9taW5pY29tXzIuMTEuMS5iYgppbmRleCAyMGNlNTY2MmMyLi5hODY2MGM5
ODI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIu
MTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20vbWluaWNvbV8yLjExLjEu
YmIKQEAgLTEsMyArMSwzMCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNyYy9taW5pY29tLmgK
KyMgKysrIHNyYy9taW5pY29tLmgKKyMgQEAgLTEsNyArMSw1IEBACisjICAvKgorIyAgICogbWlu
aWNvbS5oCUNvbnN0YW50cywgZGVmYXVsdHMsIGdsb2JhbHMgZXRjLgorIyAtICoKKyMgLSAqCQkk
SWQ6IG1pbmljb20uaCx2IDEuMjYgMjAwOS0wNi0wNiAyMToxOTozNiBhbC1ndWVzdCBFeHAgJAor
IyAgICoKKyMgICAqCQlUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgbWluaWNvbSBjb21tdW5pY2F0
aW9ucyBwYWNrYWdlLAorIyAgICoJCUNvcHlyaWdodCAxOTkxLTE5OTUgTWlxdWVsIHZhbiBTbW9v
cmVuYnVyZy4KKyMgQEAgLTEwLDMgKzgsNSBAQAorIyAgICoJCW1vZGlmeSBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjICAgKgkJYXMgcHVibGlz
aGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uCisjICAg
KgkJMiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KKyMgKyAqCisjICsgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcKKyMgCisjCisKIFNVTU1BUlkgPSAiVGV4
dC1iYXNlZCBtb2RlbSBjb250cm9sIGFuZCB0ZXJtaW5hbCBlbXVsYXRpb24gcHJvZ3JhbSIKIEhP
TUVQQUdFID0gImh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9taW5pY29tLXRlYW0vbWluaWNvbSIK
IERFU0NSSVBUSU9OID0gIk1pbmljb20gaXMgYSB0ZXh0LWJhc2VkIG1vZGVtIGNvbnRyb2wgYW5k
IHRlcm1pbmFsIGVtdWxhdGlvbiBwcm9ncmFtIGZvciBVbml4LWxpa2Ugb3BlcmF0aW5nIHN5c3Rl
bXMiCkBAIC01LDExICszMiwxMiBAQCBTRUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIERFUEVO
RFMgPSAibmN1cnNlcyB2aXJ0dWFsL2xpYmljb252IgogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxh
dGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NDIwNDc3YWJjNTY3
NDA0ZGViY2EwYTJhMWNiNmI2NDUgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL21p
bmljb20uaDtiZWdpbmxpbmU9MTtlbmRsaW5lPTEyO21kNT1hNTg4MzhjYjcwOWYwZGI1MTdmNGU0
MjczMGM0OWU4MSIKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9taW5pY29tLmg7YmVn
aW5saW5lPTE7ZW5kbGluZT0xMjttZDU9NmJlZTk1ZDA5OTY0OTE3MDNlZGUxYmQyNmNjZjJkZTcg
XAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9t
YWluL20vJHtCUE59LyR7QlBOfV8ke1BWfS5vcmlnLnRhci5iejIiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MGU3Y2UyODU2YjNlYWFhM2Y0NTIzNTRkMTc5ODFjNDlkMzJjNDI2YTI1NWI2ZjBk
MzA2M2EyMjdjMTAxNTM4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3Y2YwZGE5MWFmMDUzMTM1
N2NkNjFiOGUxOTA2YjkwN2VkZDJjOWVmODJmOWFlNzRjMjc3ZTE4OTNkMGY5OGMiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2xvY2tkZXZdID0gIi0tZW5hYmxlLWxvY2tk
ZXYsLS1kaXNhYmxlLWxvY2tkZXYsbG9ja2RldiIKLS0gCjIuNDcuMQoK

--===============6930343940712459161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/minicom: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom: SRC_URI changed from "http://deb.debian.org/debian/pool/main/m/minicom/minicom_2.10.orig.tar.bz2" to "http://deb.debian.org/debian/pool/main/m/minicom/minicom_2.11.1.orig.tar.bz2"
packages/x86-64-v3-poky-linux/minicom/minicom-dbg: PKGSIZE changed from 623904 to 632536 (+1%)
packages/x86-64-v3-poky-linux/minicom/minicom-dbg: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-dbg: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom-dev: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-dev: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom-doc: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-doc: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom-locale: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-locale: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom-src: PKGSIZE changed from 435044 to 438603 (+1%)
packages/x86-64-v3-poky-linux/minicom/minicom-src: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-src: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom-src: FILELIST: directory renamed /usr/src/debug/minicom/2.10/lib -> /usr/src/debug/minicom/2.11.1/lib, directory renamed /usr/src/debug/minicom/2.10/src -> /usr/src/debug/minicom/2.11.1/src
packages/x86-64-v3-poky-linux/minicom/minicom-staticdev: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom-staticdev: PV changed from "2.10" to "2.11.1"
packages/x86-64-v3-poky-linux/minicom/minicom: PKGSIZE changed from 279570 to 279503 (-0%)
packages/x86-64-v3-poky-linux/minicom/minicom: PKGV changed from 2.10 [default] to 2.11.1 [default]
packages/x86-64-v3-poky-linux/minicom/minicom: PV changed from "2.10" to "2.11.1"

--===============6930343940712459161==--

