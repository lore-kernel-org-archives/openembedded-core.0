Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6631.1794980483044505394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tv4eNW6Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xQGz8p2j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1ed2c8be0-51724dca-51e4-4e80-b3aa-07d573ead13b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980482;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=sAoHu2XrSCW7Ygm4H7s019KZvTTqYUPPWf+1RJE9Jfs=;
	b=tv4eNW6YzIcVB6cPWwcBjJNFGaQ7jya4GAsr9MQTbWuq+mqNu3fmc3hoN8NzKsg4
	S4W6JF8KTP/v63dTYkxWAphxYeVdscXuIjtQ1n19B1px9iyJINREYIci6afe73foXVZ
	2wERyTl+bIpY0/a0E1GyxYS0mhvp1lObpLxPaBd4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980482;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=sAoHu2XrSCW7Ygm4H7s019KZvTTqYUPPWf+1RJE9Jfs=;
	b=xQGz8p2jTtSifGEiYOrwTXXmTQITrKPFLDJU1FhzYqt20DXiFGu48GXewQiJzLOf
	QlQAc/84r7ukv6zDQBd5DoWki9PgJYv6WgAlm4SyqBHT38g1TUVwBRN412hozBL56OQ
	Pwqy8rbBsYEKs4ce32EgyJN1Qpm+kEVC78d89XTs=
Content-Type: multipart/mixed; boundary="===============6716441676619141573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxfont2,libfontenc: upgrading to 2.0.10,1.1.10 SUCCEEDED
Message-ID: <010101a1ed2c8be0-51724dca-51e4-4e80-b3aa-07d573ead13b-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250506

--===============6716441676619141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxfont2,libfontenc* to *2.0.10,1.1.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxfont2-libfontenc-upgrade-2.0.9-2.0.10-1.1.9-1.1..patch
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
From 5855a8d9bdf209047e091e9c542bb321dd1b279d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Nov 2026 05:12:50 +0000
Subject: [PATCH] libxfont2,libfontenc: upgrade 2.0.9 -> 2.0.10,1.1.9 -> 1.1.10

libXfont2 2.0.10
FreeType: always initialise strike_index
bufio,pcf: reject negative skip count in BufFileRawSkip
Remove support for SNF
license: complete the XFree86 License

libfontenc 1.1.10
test: add pytest suite for setCode() heap OOB write (CVE-2026-109908)
encparse: fix heap out-of-bounds write in setCode()
encparse: fix undersized realloc in NAME_LINE handler
gitlab CI: explicitly add container-prep to the needs
gitlab CI: bump to latest ci-templates
Plug leak in FontMapReverse() error path
---
 ...bfontenc_1.1.9.bb => libfontenc_1.1.10.bb} |  2 +-
 ...libxfont2_2.0.9.bb => libxfont2_2.0.10.bb} | 55 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.9.bb => libfontenc_1.1.10.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.9.bb => libxfont2_2.0.10.bb} (20%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.10.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.10.bb
index d5c1ed54eb..1b9c036976 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.10.bb
@@ -14,6 +14,6 @@ XORGBUILDCLASS = "meson"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "9d8392705cb10803d5fe1d27d236cbab3f664e26841ce01916bbbe430cf273e2"
+SRC_URI[sha256sum] = "daa186a49e3cc2b6fc585ca09971351e6f010f618abc6a164eda82e42e4aa4d6"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.10.bb
similarity index 20%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.10.bb
index 18e822aebd..fda3eb513b 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.10.bb
@@ -1,3 +1,54 @@
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
+# @@ -241,22 +241,26 @@
+#     written by Mark Eichin <eichin@kitten.gen.ma.us> September 1996.
+#     intended for inclusion in X11 public releases. */
+#  
+# -
+# -Copyright (c) 1999  The XFree86 Project Inc.
+# -
+# -All Rights Reserved.
+# +Copyright (C) 1994-2003 The XFree86 Project, Inc. All Rights Reserved.
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to
+# +deal in the Software without restriction, including without limitation the
+# +rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+# +sell copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+#  
+#  The above copyright notice and this permission notice shall be included in
+#  all copies or substantial portions of the Software.
+#  
+#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
+# -OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+# -AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +XFREE86 PROJECT BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
+# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+#  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+#  
+# -Except as contained in this notice, the name of The XFree86 Project
+# -Inc. shall not be used in advertising or otherwise to promote the
+# -sale, use or other dealings in this Software without prior written
+# -authorization from The XFree86 Project Inc..
+# +Except as contained in this notice, the name of the XFree86 Project shall
+# +not be used in advertising or otherwise to promote the sale, use or other
+# +dealings in this Software without prior written authorization from the
+# +XFree86 Project.
+# 
+#
+
 SUMMARY = "XFont2: X Font rasterisation library"
 
 DESCRIPTION = "libXfont2 provides various services for X servers, most \
@@ -7,7 +58,7 @@ such as freetype)."
 require xorg-lib-common.inc
 
 LICENSE = "BSD-2-Clause AND BSD-4-Clause-UC AND MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a5d1388c9d40be70dbad35fa440443f7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=26bd56a601ea26e1f38a72471dbfa561"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 
@@ -15,7 +66,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2"
+SRC_URI[sha256sum] = "cef1f4ad9cd69f439bb1ac484bdc8f9d7f8e70215b92d8ca86b96e31513e5f9c"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============6716441676619141573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxfont2-libfontenc-upgrade-2.0.9-2.0.10-1.1.9-1.1..patch"

RnJvbSA1ODU1YThkOWJkZjIwOTA0N2UwOTFlOWM1NDJiYjMyMWRkMWIyNzlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggTm92IDIwMjYgMDU6MTI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Zm9udDIsbGliZm9udGVuYzogdXBncmFkZSAyLjAuOSAtPiAyLjAuMTAsMS4xLjkgLT4gMS4x
LjEwCgpsaWJYZm9udDIgMi4wLjEwCkZyZWVUeXBlOiBhbHdheXMgaW5pdGlhbGlzZSBzdHJpa2Vf
aW5kZXgKYnVmaW8scGNmOiByZWplY3QgbmVnYXRpdmUgc2tpcCBjb3VudCBpbiBCdWZGaWxlUmF3
U2tpcApSZW1vdmUgc3VwcG9ydCBmb3IgU05GCmxpY2Vuc2U6IGNvbXBsZXRlIHRoZSBYRnJlZTg2
IExpY2Vuc2UKCmxpYmZvbnRlbmMgMS4xLjEwCnRlc3Q6IGFkZCBweXRlc3Qgc3VpdGUgZm9yIHNl
dENvZGUoKSBoZWFwIE9PQiB3cml0ZSAoQ1ZFLTIwMjYtMTA5OTA4KQplbmNwYXJzZTogZml4IGhl
YXAgb3V0LW9mLWJvdW5kcyB3cml0ZSBpbiBzZXRDb2RlKCkKZW5jcGFyc2U6IGZpeCB1bmRlcnNp
emVkIHJlYWxsb2MgaW4gTkFNRV9MSU5FIGhhbmRsZXIKZ2l0bGFiIENJOiBleHBsaWNpdGx5IGFk
ZCBjb250YWluZXItcHJlcCB0byB0aGUgbmVlZHMKZ2l0bGFiIENJOiBidW1wIHRvIGxhdGVzdCBj
aS10ZW1wbGF0ZXMKUGx1ZyBsZWFrIGluIEZvbnRNYXBSZXZlcnNlKCkgZXJyb3IgcGF0aAotLS0K
IC4uLmJmb250ZW5jXzEuMS45LmJiID0+IGxpYmZvbnRlbmNfMS4xLjEwLmJifSB8ICAyICstCiAu
Li5saWJ4Zm9udDJfMi4wLjkuYmIgPT4gbGlieGZvbnQyXzIuMC4xMC5iYn0gfCA1NSArKysrKysr
KysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJmb250ZW5j
XzEuMS45LmJiID0+IGxpYmZvbnRlbmNfMS4xLjEwLmJifSAoODElKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieGZvbnQyXzIuMC45LmJiID0+IGxpYnhmb250Ml8y
LjAuMTAuYmJ9ICgyMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYmZvbnRlbmNfMS4xLjkuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGliZm9udGVuY18xLjEuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYmZvbnRlbmNfMS4xLjkuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJmb250ZW5jXzEuMS4xMC5iYgppbmRl
eCBkNWMxZWQ1NGViLi4xYjljMDM2OTc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvbGliZm9udGVuY18xLjEuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvbGliZm9udGVuY18xLjEuMTAuYmIKQEAgLTE0LDYgKzE0LDYgQEAgWE9SR0JV
SUxEQ0xBU1MgPSAibWVzb24iCiAKIFBFID0gIjEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5
ZDgzOTI3MDVjYjEwODAzZDVmZTFkMjdkMjM2Y2JhYjNmNjY0ZTI2ODQxY2UwMTkxNmJiYmU0MzBj
ZjI3M2UyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRhYTE4NmE0OWUzY2MyYjZmYzU4NWNhMDk5
NzEzNTFlNmYwMTBmNjE4YWJjNmExNjRlZGE4MmU0MmU0YWE0ZDYiCiAKIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xp
Ynhmb250Ml8yLjAuOS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9u
dDJfMi4wLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggMjAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9udDJfMi4wLjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9udDJfMi4wLjEwLmJiCmluZGV4IDE4ZTgyMmFl
YmQuLmZkYTNlYjUxM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9saWJ4Zm9udDJfMi4wLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L2xpYnhmb250Ml8yLjAuMTAuYmIKQEAgLTEsMyArMSw1NCBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTI0MSwyMiArMjQxLDI2IEBACisjICAg
ICB3cml0dGVuIGJ5IE1hcmsgRWljaGluIDxlaWNoaW5Aa2l0dGVuLmdlbi5tYS51cz4gU2VwdGVt
YmVyIDE5OTYuCisjICAgICBpbnRlbmRlZCBmb3IgaW5jbHVzaW9uIGluIFgxMSBwdWJsaWMgcmVs
ZWFzZXMuICovCisjICAKKyMgLQorIyAtQ29weXJpZ2h0IChjKSAxOTk5ICBUaGUgWEZyZWU4NiBQ
cm9qZWN0IEluYy4KKyMgLQorIyAtQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMgK0NvcHlyaWdodCAo
QykgMTk5NC0yMDAzIFRoZSBYRnJlZTg2IFByb2plY3QsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZl
ZC4KKyMgKworIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyArb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvCisjICtk
ZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91
dCBsaW1pdGF0aW9uIHRoZQorIyArcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yCisjICtzZWxsIGNvcGllcyBv
ZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2Fy
ZSBpcworIyArZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9uczoKKyMgIAorIyAgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVy
bWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgIGFsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAgCisjICBUSEUgU09GVFdBUkUg
SVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVT
UyBPUgorIyAgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjIC1GSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjIC1PUEVO
IEdST1VQIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSIExJQUJJTElU
WSwgV0hFVEhFUiBJTgorIyAtQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lT
RSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4KKyMgK0ZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyAr
WEZSRUU4NiBQUk9KRUNUIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVS
IExJQUJJTElUWSwgV0hFVEhFUgorIyArSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9S
IE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4KKyMgIENPTk5FQ1RJT04gV0lU
SCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdB
UkUuCisjICAKKyMgLUV4Y2VwdCBhcyBjb250YWluZWQgaW4gdGhpcyBub3RpY2UsIHRoZSBuYW1l
IG9mIFRoZSBYRnJlZTg2IFByb2plY3QKKyMgLUluYy4gc2hhbGwgbm90IGJlIHVzZWQgaW4gYWR2
ZXJ0aXNpbmcgb3Igb3RoZXJ3aXNlIHRvIHByb21vdGUgdGhlCisjIC1zYWxlLCB1c2Ugb3Igb3Ro
ZXIgZGVhbGluZ3MgaW4gdGhpcyBTb2Z0d2FyZSB3aXRob3V0IHByaW9yIHdyaXR0ZW4KKyMgLWF1
dGhvcml6YXRpb24gZnJvbSBUaGUgWEZyZWU4NiBQcm9qZWN0IEluYy4uCisjICtFeGNlcHQgYXMg
Y29udGFpbmVkIGluIHRoaXMgbm90aWNlLCB0aGUgbmFtZSBvZiB0aGUgWEZyZWU4NiBQcm9qZWN0
IHNoYWxsCisjICtub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvciBvdGhlcndpc2UgdG8gcHJv
bW90ZSB0aGUgc2FsZSwgdXNlIG9yIG90aGVyCisjICtkZWFsaW5ncyBpbiB0aGlzIFNvZnR3YXJl
IHdpdGhvdXQgcHJpb3Igd3JpdHRlbiBhdXRob3JpemF0aW9uIGZyb20gdGhlCisjICtYRnJlZTg2
IFByb2plY3QuCisjIAorIworCiBTVU1NQVJZID0gIlhGb250MjogWCBGb250IHJhc3RlcmlzYXRp
b24gbGlicmFyeSIKIAogREVTQ1JJUFRJT04gPSAibGliWGZvbnQyIHByb3ZpZGVzIHZhcmlvdXMg
c2VydmljZXMgZm9yIFggc2VydmVycywgbW9zdCBcCkBAIC03LDcgKzU4LDcgQEAgc3VjaCBhcyBm
cmVldHlwZSkuIgogcmVxdWlyZSB4b3JnLWxpYi1jb21tb24uaW5jCiAKIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIEFORCBCU0QtNC1DbGF1c2UtVUMgQU5EIE1JVCIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE1ZDEzODhjOWQ0MGJlNzBkYmFkMzVmYTQ0MDQ0M2Y3Igor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MjZiZDU2YTYwMWVhMjZlMWYz
OGE3MjQ3MWRiZmE1NjEiCiAKIERFUEVORFMgKz0gImZyZWV0eXBlIHh0cmFucyB4b3JncHJvdG8g
bGliZm9udGVuYyB6bGliIgogCkBAIC0xNSw3ICs2Niw3IEBAIFhPUkdfUE4gPSAibGliWGZvbnQy
IgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYw
NDJhMzcwNjY2ODE1ZTdiOTQxZTliNzAxOTAyNDc1NWJkMWM2YzI5NTRhZmJmYTUxNWFmMzc4MjUx
Nzk5ZTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2VmMWY0YWQ5Y2Q2OWY0MzliYjFhYzQ4NGJk
YzhmOWQ3ZjhlNzAyMTViOTJkOGNhODZiOTZlMzE1MTNlNWY5YyIKIAogUEFDS0FHRUNPTkZJRyA/
Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCiBQ
QUNLQUdFQ09ORklHW2lwdjZdID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIgotLSAK
Mi40Ny4xCgo=

--===============6716441676619141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libfontenc: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc: SRC_URI changed from "https://www.x.org/releases//individual/lib/libfontenc-1.1.9.tar.xz" to "https://www.x.org/releases//individual/lib/libfontenc-1.1.10.tar.xz"
packages/x86-64-v3-poky-linux/libfontenc: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dbg: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dbg: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dbg: PKGSIZE changed from 57584 to 57688 (+0%)
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-dev: PKGSIZE changed from 5312 to 5313 (+0%)
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-doc: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-doc: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-locale: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-locale: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: FILELIST: directory renamed /usr/src/debug/libfontenc/1.1.9/src -> /usr/src/debug/libfontenc/1.1.10/src, directory renamed /usr/src/debug/libfontenc/1.1.9/include/X11/fonts -> /usr/src/debug/libfontenc/1.1.10/include/X11/fonts
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-src: PKGSIZE changed from 65443 to 65689 (+0%)
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-staticdev: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc-staticdev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PV changed from "1.1.9" to "1.1.10"
packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PKGSIZE changed from 34411 to 38507 (+12%)
packages/x86-64-v3-poky-linux/libxfont2: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXfont2-2.0.9.tar.xz" to "https://www.x.org/releases//individual/lib/libXfont2-2.0.10.tar.xz"
packages/x86-64-v3-poky-linux/libxfont2: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGSIZE changed from 607312 to 607616 (+0%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PKGSIZE changed from 5578 to 5579 (+0%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: FILELIST: directory renamed /usr/src/debug/libxfont2/2.0.9/include -> /usr/src/debug/libxfont2/2.0.10/include, directory renamed /usr/src/debug/libxfont2/2.0.9/src/builtins -> /usr/src/debug/libxfont2/2.0.10/src/builtins, directory renamed /usr/src/debug/libxfont2/2.0.9/src/util -> /usr/src/debug/libxfont2/2.0.10/src/util, directory renamed /usr/src/debug/libxfont2/2.0.9/src/FreeType -> /usr/src/debug/libxfont2/2.0.10/src/FreeType, directory renamed /usr/src/debug/libxfont2/2.0.9/src/bitmap -> /usr/src/debug/libxfont2/2.0.10/src/bitmap, directory renamed /usr/src/debug/libxfont2/2.0.9/src/fontfile -> /usr/src/debug/libxfont2/2.0.10/src/fontfile, directory renamed /usr/src/debug/libxfont2/2.0.9/src/stubs -> /usr/src/debug/libxfont2/2.0.10/src/stubs, directory renamed /usr/src/debug/libxfont2/2.0.9/include/X11/fonts -> /usr/src/debug/libxfont2/2.0.10/include/X11/fonts
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGSIZE changed from 659714 to 658970 (-0%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PKGV changed from 2.0.9 [default] to 2.0.10 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PV changed from "2.0.9" to "2.0.10"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PKGV changed from 2.0.9 [default] to 2.0.10 [default]

--===============6716441676619141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libfontenc/libfontenc: PKGSIZE changed from 34411 to 38507 (+12%)

--===============6716441676619141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxfont2-changelog.txt"

libXfont2 2.0.10
FreeType: always initialise strike_index
bufio,pcf: reject negative skip count in BufFileRawSkip
Remove support for SNF
license: complete the XFree86 License

--===============6716441676619141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libfontenc-changelog.txt"

libfontenc 1.1.10
test: add pytest suite for setCode() heap OOB write (CVE-2026-109908)
encparse: fix heap out-of-bounds write in setCode()
encparse: fix undersized realloc in NAME_LINE handler
gitlab CI: explicitly add container-prep to the needs
gitlab CI: bump to latest ci-templates
Plug leak in FontMapReverse() error path

--===============6716441676619141573==--
