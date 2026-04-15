Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCD8F4383C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19809.1776261870602113538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fnYTsxrw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g5fG9ACo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91758861-8804e727-d70d-4a08-ba34-26552b60379a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R1L3H60pI/iE/yUrUdPsJUcMy5kwaXHc3SSWexviojs=;
	b=fnYTsxrwBJ7bPD0FVRDsi2Y7BSLpBiyBWW3ERllHTcTMhoa5jH3g1A/J4Guvba5R
	RvdOZ450UtKe/Vd/R3h8fdNgRpph3Onza5xiMHyjagHBITJWILu1egTrj28orObIL1F
	TXHZQh43ghfwQ7lSi29PkmIbW0DVMd6KL+coQpdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R1L3H60pI/iE/yUrUdPsJUcMy5kwaXHc3SSWexviojs=;
	b=g5fG9ACoC2PVk0qdwG3gQwCBTVb/yq1z9Ak52aj9sE2pKHJGbnmFHN7OzbzgvJbO
	KJB49GzmpU9SWNBMKLVXo7B0rft3YL75voMdaa2jcIFEtmAfNJQQk8YqpsifNjcquho
	oXLSPVaTo1jqhDCimakGIwB99hXPoK66O4qS75PE=
Content-Type: multipart/mixed; boundary="===============5157223176126799360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.10 SUCCEEDED
Message-ID: <0101019d91758861-8804e727-d70d-4a08-ba34-26552b60379a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235288

--===============5157223176126799360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.9-24.1.10.patch
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
From 470cdaa4be3829a1205f3796e620596eb2abc847 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:36:14 +0000
Subject: [PATCH] xwayland: upgrade 24.1.9 -> 24.1.10

---
 ...xwayland_24.1.9.bb => xwayland_24.1.10.bb} | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.10.bb} (62%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.10.bb
similarity index 62%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.10.bb
index df1bb7e31b..2e5509c85e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.10.bb
@@ -1,3 +1,37 @@
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
+# @@ -314,6 +314,11 @@
+#  OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+#  SOFTWARE.
+#  
+# +Except as contained in this notice, the name of Silicon Graphics, Inc.
+# +shall not be used in advertising or otherwise to promote the sale, use or
+# +other dealings in this Software without prior written authorization from
+# +Silicon Graphics, Inc.
+# +
+#  
+#  Copyright (c) 1994, 1995  Hewlett-Packard Company
+#  
+# @@ -1778,6 +1783,8 @@
+#  USE OR OTHER DEALINGS IN THE SOFTWARE.
+#  
+#  
+# +Author: Eamon Walsh <ewalsh@tycho.nsa.gov>
+# +
+#  Permission to use, copy, modify, distribute, and sell this software and its
+#  documentation for any purpose is hereby granted without fee, provided that
+#  this permission notice appear in supporting documentation.  This permission
+# 
+#
+
 SUMMARY = "XWayland is an X Server that runs under Wayland."
 DESCRIPTION = "XWayland is an X Server running as a Wayland client, \
 and thus is capable of displaying native X11 client applications in a \
@@ -7,10 +41,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============5157223176126799360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.9-24.1.10.patch"

RnJvbSA0NzBjZGFhNGJlMzgyOWExMjA1ZjM3OTZlNjIwNTk2ZWIyYWJjODQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6MzY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjkgLT4gMjQuMS4xMAoKLS0tCiAuLi54d2F5bGFuZF8yNC4x
LjkuYmIgPT4geHdheWxhbmRfMjQuMS4xMC5iYn0gfCAzOCArKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQve3h3YXlsYW5kXzI0LjEuOS5iYiA9PiB4d2F5
bGFuZF8yNC4xLjEwLmJifSAoNjIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjkuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDYyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS45LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMC5iYgpp
bmRleCBkZjFiYjdlMzFiLi4yZTU1MDljODVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjEwLmJiCkBAIC0xLDMgKzEsMzcgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0zMTQsNiArMzE0
LDExIEBACisjICBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0Ug
T1IgT1RIRVIgREVBTElOR1MgSU4gVEhFCisjICBTT0ZUV0FSRS4KKyMgIAorIyArRXhjZXB0IGFz
IGNvbnRhaW5lZCBpbiB0aGlzIG5vdGljZSwgdGhlIG5hbWUgb2YgU2lsaWNvbiBHcmFwaGljcywg
SW5jLgorIyArc2hhbGwgbm90IGJlIHVzZWQgaW4gYWR2ZXJ0aXNpbmcgb3Igb3RoZXJ3aXNlIHRv
IHByb21vdGUgdGhlIHNhbGUsIHVzZSBvcgorIyArb3RoZXIgZGVhbGluZ3MgaW4gdGhpcyBTb2Z0
d2FyZSB3aXRob3V0IHByaW9yIHdyaXR0ZW4gYXV0aG9yaXphdGlvbiBmcm9tCisjICtTaWxpY29u
IEdyYXBoaWNzLCBJbmMuCisjICsKKyMgIAorIyAgQ29weXJpZ2h0IChjKSAxOTk0LCAxOTk1ICBI
ZXdsZXR0LVBhY2thcmQgQ29tcGFueQorIyAgCisjIEBAIC0xNzc4LDYgKzE3ODMsOCBAQAorIyAg
VVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyMgIAorIyAgCisjICtBdXRo
b3I6IEVhbW9uIFdhbHNoIDxld2Fsc2hAdHljaG8ubnNhLmdvdj4KKyMgKworIyAgUGVybWlzc2lv
biB0byB1c2UsIGNvcHksIG1vZGlmeSwgZGlzdHJpYnV0ZSwgYW5kIHNlbGwgdGhpcyBzb2Z0d2Fy
ZSBhbmQgaXRzCisjICBkb2N1bWVudGF0aW9uIGZvciBhbnkgcHVycG9zZSBpcyBoZXJlYnkgZ3Jh
bnRlZCB3aXRob3V0IGZlZSwgcHJvdmlkZWQgdGhhdAorIyAgdGhpcyBwZXJtaXNzaW9uIG5vdGlj
ZSBhcHBlYXIgaW4gc3VwcG9ydGluZyBkb2N1bWVudGF0aW9uLiAgVGhpcyBwZXJtaXNzaW9uCisj
IAorIworCiBTVU1NQVJZID0gIlhXYXlsYW5kIGlzIGFuIFggU2VydmVyIHRoYXQgcnVucyB1bmRl
ciBXYXlsYW5kLiIKIERFU0NSSVBUSU9OID0gIlhXYXlsYW5kIGlzIGFuIFggU2VydmVyIHJ1bm5p
bmcgYXMgYSBXYXlsYW5kIGNsaWVudCwgXAogYW5kIHRodXMgaXMgY2FwYWJsZSBvZiBkaXNwbGF5
aW5nIG5hdGl2ZSBYMTEgY2xpZW50IGFwcGxpY2F0aW9ucyBpbiBhIFwKQEAgLTcsMTAgKzQxLDEw
IEBAIGEgd2F5IHRvIHJ1biB1bnBvcnRlZCBhcHBsaWNhdGlvbnMgaW4gdGhlIG1lYW50aW1lLiIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9DaGFuZ2VzL1h3YXls
YW5kU3RhbmRhbG9uZSIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT0yMWUzM2RjY2NmMmQ1MDM0Zjc5OGE4ZWE2MjYyMjkzOSIKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWY4Nzc4Y2ZjZDkwZWNlMGU0YjIyNWYz
MDE4MjIyN2NhIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hpdmUvaW5kaXZp
ZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmMjk3YWYyN2E4NDUwOGRiOWI4MGQxY2JiY2M2OWMzODAxZGEzOGViNjRjNzJmM2I1YjUwZjU4
MjQ1OWFmZGQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ1OTc2MmJlOGVhMDQ2Yzk0Mzg2Njg3
ZDc3YTg3YWRkNjA3Mzg2OGJlZTE0ZjAyOTEzZWFmZWJiOTQ1YjdhYTAiCiAKIFVQU1RSRUFNX0NI
RUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQrKSspXC50YXIi
CiAKLS0gCjIuNDcuMQoK

--===============5157223176126799360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.9.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.10.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12583272 to 12591968 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 540 to 541 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGSIZE changed from 31919 to 31921 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8899522 to 8905896 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.9/xfixes -> /usr/src/debug/xwayland/24.1.10/xfixes, directory renamed /usr/src/debug/xwayland/24.1.9/os -> /usr/src/debug/xwayland/24.1.10/os, directory renamed /usr/src/debug/xwayland/24.1.9/mi -> /usr/src/debug/xwayland/24.1.10/mi, directory renamed /usr/src/debug/xwayland/24.1.9/Xi -> /usr/src/debug/xwayland/24.1.10/Xi, directory renamed /usr/src/debug/xwayland/24.1.9/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.10/hw/xwayland/Xwayland.p, directory renamed /usr/src/debug/xwayland/24.1.9/randr -> /usr/src/debug/xwayland/24.1.10/randr, directory renamed /usr/src/debug/xwayland/24.1.9/dri3 -> /usr/src/debug/xwayland/24.1.10/dri3, directory renamed /usr/src/debug/xwayland/24.1.9/fb -> /usr/src/debug/xwayland/24.1.10/fb, directory renamed /usr/src/debug/xwayland/24.1.9/dix -> /usr/src/debug/xwayland/24.1.10/dix, directory renamed /usr/src/debug/xwayland/24.1.9/render 
 -> /usr/src/debug/xwayland/24.1.10/render, directory renamed /usr/src/debug/xwayland/24.1.9/xkb -> /usr/src/debug/xwayland/24.1.10/xkb, directory renamed /usr/src/debug/xwayland/24.1.9/miext/sync -> /usr/src/debug/xwayland/24.1.10/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.9/miext/damage -> /usr/src/debug/xwayland/24.1.10/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.9/include -> /usr/src/debug/xwayland/24.1.10/include, directory renamed /usr/src/debug/xwayland/24.1.9/present -> /usr/src/debug/xwayland/24.1.10/present, directory renamed /usr/src/debug/xwayland/24.1.9/glamor -> /usr/src/debug/xwayland/24.1.10/glamor, directory renamed /usr/src/debug/xwayland/24.1.9/record -> /usr/src/debug/xwayland/24.1.10/record, directory renamed /usr/src/debug/xwayland/24.1.9/glx -> /usr/src/debug/xwayland/24.1.10/glx, directory renamed /usr/src/debug/xwayland/24.1.9/hw/xwayland -> /usr/src/debug/xwayland/24.1.10/hw/xwayland, directory renamed /usr/src/debug/xwayland
 /24.1.9/dbe -> /usr/src/debug/xwayland/24.1.10/dbe, directory renamed /usr/src/debug/xwayland/24.1.9/damageext -> /usr/src/debug/xwayland/24.1.10/damageext, directory renamed /usr/src/debug/xwayland/24.1.9/composite -> /usr/src/debug/xwayland/24.1.10/composite, directory renamed /usr/src/debug/xwayland/24.1.9/Xext -> /usr/src/debug/xwayland/24.1.10/Xext
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.9 [default] to 24.1.10 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.9" to "24.1.10"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.9 [default] to 24.1.10 [default]

--===============5157223176126799360==--

