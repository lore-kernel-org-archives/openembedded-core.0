Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271F3C54F21
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1275.1710522012370447044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KVjuK/KI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yQV3DDVP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430e9cdd-b04d2a39-4d1c-4c0b-947a-c5462f68e80f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=nGHH3YLgEaoONsbhAsQ3Pj91XME628iYDSIPWiC2iMI=;
	b=KVjuK/KIWm+eYc7mNLUwy+JuVe8yqLuFJjxOGYLFX8vSC4hAJIgEQrGp9PJFmrIN
	tvb1q2TE1MgkPvJi7SFKjPVxS25M/dCZGz4c3D4ADK0figyHOXIPHDkgss+hrP+mHW+
	bTZ0TG64DCLU66vzCFxHaAQsIQx2xeo7y2EJ2MPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=nGHH3YLgEaoONsbhAsQ3Pj91XME628iYDSIPWiC2iMI=;
	b=yQV3DDVPLPD+GpZflsfMLlna4MfOGS6SCEstFl4pg6HysuXJpYKnzuVMJNQmX+SS
	QWDMUH6+D2yUQ4gO8m87hl3P6mKyRS/E9jO9Qcs3g7ucTgc7Kvv1d/V40o0nPhpF6rx
	WMWHlOvtR/1BcjPjyYIJs41xp88JK5lX52dYp3K0=
Content-Type: multipart/mixed; boundary="===============7713273242402314993=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mkfontscale: upgrading to 1.2.3 SUCCEEDED
Message-ID: <0101018e430e9cdd-b04d2a39-4d1c-4c0b-947a-c5462f68e80f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197218

--===============7713273242402314993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mkfontscale* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mkfontscale-upgrade-1.2.2-1.2.3.patch
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
From 48bf87415e891a9c5e9fcfd5329a66db635507a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 13:15:26 +0000
Subject: [PATCH] mkfontscale: upgrade 1.2.2 -> 1.2.3

---
 ...ontscale_1.2.2.bb => mkfontscale_1.2.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.2.bb => mkfontscale_1.2.3.bb} (38%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
similarity index 38%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
index cd658ab219..4addbd2f46 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
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
+# @@ -18,7 +18,7 @@
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+#  
+# -Copyright (c) 2008, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 2008, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "A program to create an index of scalable font files for X"
@@ -15,7 +37,7 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
+SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
-- 
2.42.0


--===============7713273242402314993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.2.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz"
packages/core2-64-poky-linux/mkfontscale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 92896 to 95528 (+3%)
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 72554 to 74994 (+3%)
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.2" to "1.2.3"

--===============7713273242402314993==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mkfontscale-upgrade-1.2.2-1.2.3.patch"

RnJvbSA0OGJmODc0MTVlODkxYTljNWU5ZmNmZDUzMjlhNjZkYjYzNTUwN2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTM6MTU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
a2ZvbnRzY2FsZTogdXBncmFkZSAxLjIuMiAtPiAxLjIuMwoKLS0tCiAuLi5vbnRzY2FsZV8xLjIu
Mi5iYiA9PiBta2ZvbnRzY2FsZV8xLjIuMy5iYn0gfCAyNiArKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve21rZm9udHNjYWxlXzEuMi4yLmJiID0+IG1r
Zm9udHNjYWxlXzEuMi4zLmJifSAoMzglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDM4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8x
LjIuMy5iYgppbmRleCBjZDY1OGFiMjE5Li40YWRkYmQyZjQ2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCkBAIC0xLDMgKzEs
MjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBA
IC0xOCw3ICsxOCw3IEBACisjICBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZU
V0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOCisjICBUSEUgU09GVFdBUkUuCisj
ICAKKyMgLUNvcHlyaWdodCAoYykgMjAwOCwgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4g
QWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgK0NvcHlyaWdodCAoYykgMjAwOCwgT3JhY2xlIGFuZC9v
ciBpdHMgYWZmaWxpYXRlcy4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwg
ZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyMgIGNvcHkgb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksCisjIAorIworCiByZXF1aXJlIHhvcmctYXBwLWNvbW1vbi5pbmMKIAogU1VNTUFSWSA9
ICJBIHByb2dyYW0gdG8gY3JlYXRlIGFuIGluZGV4IG9mIHNjYWxhYmxlIGZvbnQgZmlsZXMgZm9y
IFgiCkBAIC0xNSw3ICszNyw3IEBAIFJQUk9WSURFUzoke1BOfSArPSAibWtmb250ZGlyIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9OTliMWUxMjY5YWJhNTE3OTEzOWI5ZTQzODBmYzA5MzQiCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01YTYwYzU5NmQxYjVmM2RlZTlmMDA1YjcwM2IzMTgw
ZCIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGFlM2ZiNWIx
ZmU3NDM2ZTFmNTY1MDYwYWNhYTNlMjkxOGZlNzQ1YjBlNDk3OWI1NTkzOTY4OTE0ZmUyZDVjNCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTIxY2RjMzQ0ZjFhY2VlMDRiY2Q2ZWExZTI5NTY1YzEz
MDgyNjMwMDZlMTM0YTllZTM4Y2Y5YzlkNmZlNzVlIgotLSAKMi40Mi4wCgo=

--===============7713273242402314993==--

