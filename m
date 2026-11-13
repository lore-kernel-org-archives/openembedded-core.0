Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5927.1794551759378121421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZJfo0mkC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2t8swlEy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1d39ecb06-5eabffd8-6775-46bb-b788-ef787761444e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551761;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H/DsnxPoVU3YvuEDbHHuE9avYRMAqw3Kdu/HjSi7wHw=;
	b=ZJfo0mkCjUfyYEtPAEZyAr5qD/RrktIMDhzCkeir75uiw0RyJ/+4D3tO39Wa7ZJ4
	99rsetVyhwWFF5oyUxv+LoQlDPl2nzauFMlWxMSJE/rWJV8TYq4dL/Qmb1EDkUiqVfx
	3GDwVugbNSArTggLmVwmmWgHlanEoLn79hL+we64=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551761;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H/DsnxPoVU3YvuEDbHHuE9avYRMAqw3Kdu/HjSi7wHw=;
	b=2t8swlEyD3zvRgW1lYNEUn3fd5ruG+GX7b/xTdrIUaxPqNmLTaGinueWnI6nAHSf
	uYkS6V8FzvQC9X3f/Gy56mkR6gYCBf/Wd4TyvM9KbgCe8pZr2BcbFjPWrdiApez5qks
	5xcfKYVhHB3wiRLd6e64+ZDph/6o6PUYZGy2OiUo=
Content-Type: multipart/mixed; boundary="===============1986241480932525131=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.7.0 FAILED
Message-ID: <010101a1d39ecb06-5eabffd8-6775-46bb-b788-ef787761444e-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:36:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250150

--===============1986241480932525131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjitterentropy* to *3.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.6.3-3.7.0.patch
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
From 941f6b6017186f41e08279f2b01414b28541fb96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 13 Nov 2026 06:22:12 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.6.3 -> 3.7.0

3.7.0
---
 ...opy_3.6.3.bb => libjitterentropy_3.7.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb => libjitterentropy_3.7.0.bb} (55%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
similarity index 55%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index 27c87c1322..bf89b50d65 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2017 - 2025, Stephan Mueller <smueller@chronox.de>
+# +Copyright (C) 2017 - 2026, Stephan Mueller <smueller@chronox.de>
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Hardware RNG based on CPU timing jitter"
 DESCRIPTION = "The Jitter RNG provides a noise source using the CPU execution timing jitter. \
 It does not depend on any system resource other than a high-resolution time \
@@ -5,12 +24,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "https://www.chronox.de/jent"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcaa2e2fa77c4ea22e45bf79e9a41093 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
+SRCREV = "e783cf1c450bce4d72f95c9f9c84546a6094976a"
 
 do_configure[noexec] = "1"
 
-- 
2.47.1


--===============1986241480932525131==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.6.3-3.7.0.patch"

RnJvbSA5NDFmNmI2MDE3MTg2ZjQxZTA4Mjc5ZjJiMDE0MTRiMjg1NDFmYjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTMgTm92IDIwMjYgMDY6MjI6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNi4zIC0+IDMuNy4wCgozLjcuMAotLS0KIC4uLm9w
eV8zLjYuMy5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNy4wLmJifSB8IDIzICsrKysrKysrKysr
KysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkve2xpYmppdHRl
cmVudHJvcHlfMy42LjMuYmIgPT4gbGliaml0dGVyZW50cm9weV8zLjcuMC5iYn0gKDU1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRl
cmVudHJvcHlfMy42LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5
L2xpYmppdHRlcmVudHJvcHlfMy43LjAuYmIKc2ltaWxhcml0eSBpbmRleCA1NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5
XzMuNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5
L2xpYmppdHRlcmVudHJvcHlfMy43LjAuYmIKaW5kZXggMjdjODdjMTMyMi4uYmY4OWI1MGQ2NSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0
ZXJlbnRyb3B5XzMuNi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVu
dHJvcHkvbGliaml0dGVyZW50cm9weV8zLjcuMC5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1F
OiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRv
b2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElD
RU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhl
IGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAn
TGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFu
Z2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLUNvcHlyaWdodCAoQykgMjAxNyAtIDIwMjUsIFN0ZXBoYW4gTXVlbGxlciA8c211ZWxsZXJA
Y2hyb25veC5kZT4KKyMgK0NvcHlyaWdodCAoQykgMjAxNyAtIDIwMjYsIFN0ZXBoYW4gTXVlbGxl
ciA8c211ZWxsZXJAY2hyb25veC5kZT4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBp
biBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBtb2RpZmljYXRp
b24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMK
KyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgUk5HIGJhc2VkIG9uIENQVSB0aW1pbmcgaml0
dGVyIgogREVTQ1JJUFRJT04gPSAiVGhlIEppdHRlciBSTkcgcHJvdmlkZXMgYSBub2lzZSBzb3Vy
Y2UgdXNpbmcgdGhlIENQVSBleGVjdXRpb24gdGltaW5nIGppdHRlci4gXAogSXQgZG9lcyBub3Qg
ZGVwZW5kIG9uIGFueSBzeXN0ZW0gcmVzb3VyY2Ugb3RoZXIgdGhhbiBhIGhpZ2gtcmVzb2x1dGlv
biB0aW1lIFwKQEAgLTUsMTIgKzI0LDEyIEBAIHN0YW1wLiBJdCBpcyBhIHNtYWxsLXNjYWxlLCB5
ZXQgZmFzdCBlbnRyb3B5IHNvdXJjZSB0aGF0IGlzIHZpYWJsZSBpbiBhbG1vc3QgXAogYWxsIGVu
dmlyb25tZW50cyBhbmQgb24gYSBsb3Qgb2YgQ1BVIGFyY2hpdGVjdHVyZXMuIgogSE9NRVBBR0Ug
PSAiaHR0cHM6Ly93d3cuY2hyb25veC5kZS9qZW50IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2Ug
T1IgR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
ZTAxMDI3YzRhZDFmZTVhNDc2OGY4NDg4Yzk0NWQ0OTEgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ZmNhYTJlMmZhNzdjNGVhMjJlNDViZjc5ZTlhNDEwOTMgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5ncGx2MjttZDU9ZWI3MjNiNjE1MzlmZWVm
MDEzZGU0NzZlNjhiNWM1MGEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5i
c2Q7bWQ1PTY2YTVjZWRhZjYyYzRiMjYzNzAyNWYwNDlmOWI4MjZmIFwKICAgICAgICAgICAgICAg
ICAgICAgIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3NtdWVsbGVyREQvaml0dGVyZW50
cm9weS1saWJyYXJ5LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0i
Ci1TUkNSRVYgPSAiYzkwZmY0NjVkY2RiNmE2OTQ5NTQyYzcyYTI2YThhYjQ5NmRhYThjYiIKK1NS
Q1JFViA9ICJlNzgzY2YxYzQ1MGJjZTRkNzJmOTVjOWY5Yzg0NTQ2YTYwOTQ5NzZhIgogCiBkb19j
b25maWd1cmVbbm9leGVjXSA9ICIxIgogCi0tIAoyLjQ3LjEKCg==

--===============1986241480932525131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy: SRC_URI changed from "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.6.3" to "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.6.3", added "/usr/lib/.debug/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 63992 to 84464 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 4567 to 4643 (+2%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: FILELIST: directory renamed /usr/src/debug/libjitterentropy/3.6.3 -> /usr/src/debug/libjitterentropy/3.7.0, removed "/usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.h", added "/usr/src/debug/libjitterentropy/3.7.0/src
 /jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-base.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-base.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-status.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-internal.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.h"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============1986241480932525131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 63992 to 84464 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============1986241480932525131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-a49a47c77c4a08d15ce9c751bc8a91719ae096eb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:a49a47c77c4a08d15ce9c751bc8a91719ae096eb"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 123 Local 111 Mirrors 0 Missed 12 Current 233 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 304 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 871 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 310 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 313 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 872 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 324 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 328 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 329 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 330 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 331 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 873 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Started
NOTE: Running setscene task 333 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 338 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 884 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 346 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 979 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 985 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_deploy_source_date_epoch unihash changed to 5482649955b8b259c1c754fb584cfd88e6c53516953602edf374715833b18954
NOTE: Setscene tasks completed
NOTE: Running noexec task 987 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_configure)
NOTE: Running task 988 of 999 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-base.o src/jitterentropy-base.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-gcd.o src/jitterentropy-gcd.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-health.o src/jitterentropy-health.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-noise.o src/jitterentropy-noise.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-sha3.o src/jitterentropy-sha3.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-status.o src/jitterentropy-status.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-timer.o src/jitterentropy-timer.c
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-status.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-health.h:23,
|                  from src/jitterentropy-health.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-timer.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-gcd.h:23,
|                  from src/jitterentropy-gcd.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-noise.h:23,
|                  from src/jitterentropy-noise.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-sha3.h:23,
|                  from src/jitterentropy-sha3.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-base.c:32:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [<builtin>: jitterentropy-gcd.o] Error 1
| make: *** Waiting for unfinished jobs....
| make: *** [<builtin>: jitterentropy-timer.o] Error 1
| make: *** [<builtin>: jitterentropy-noise.o] Error 1
| make: *** [<builtin>: jitterentropy-health.o] Error 1
| make: *** [<builtin>: jitterentropy-status.o] Error 1
| make: *** [<builtin>: jitterentropy-base.o] Error 1
| make: *** [<builtin>: jitterentropy-sha3.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 172
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 157
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 162
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 140
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 134
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680, line 182
NOTE: recipe libjitterentropy-3.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 988 tasks of which 979 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113062158.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113062158.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2140680
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libjitterentropy-3.7.0-r0 do_compile: oe_runmake failed
ERROR: libjitterentropy-3.7.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2140680' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2140680
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile) failed with exit code '1'

--===============1986241480932525131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libjitterentropy-changelog.txt"

3.7.0

--===============1986241480932525131==--
