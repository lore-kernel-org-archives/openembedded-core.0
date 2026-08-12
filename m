Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB3EC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:00:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1830.1786514410902148382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V4bjfIUQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PapIXd3a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ff48e96a6-95dc3972-bc85-4689-876b-375f31ab7106-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786514413;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M5vEgPAyjTr3Fc+UfpeKaTmR+E+0hhFUGFx2IYe3nlY=;
	b=V4bjfIUQ9m2WoqBqdidX2bSU8LZphXAXU3qvNm0KReWyXKyenG63gBmxxFWxKh3g
	ATSTbsNcDikjxABvRxSSaWANlKxpH++S4/YNgVC+oQYAt/8KbkdB5FdNxyfbsY8WcXF
	lFX2uTCxvG9rahPcBBaPkGc9KTFeKlxVL2N65jTw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786514413;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M5vEgPAyjTr3Fc+UfpeKaTmR+E+0hhFUGFx2IYe3nlY=;
	b=PapIXd3anz5xXY5PdAe2fIUkE4kaoImXaErIRe/ZZs+948cQaweHi4/yOjYK8eru
	NI5OTOEf/HnSDANve73YvlV2XQGiOz0PM36xWAYierHTvQDCfxgaEx0/bPgJyikwptR
	5P9lwrgPWZhIa0pcm4yOGjmlgmUpnd3mVuLhb+MY=
Content-Type: multipart/mixed; boundary="===============2769400230621752582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.7.0 FAILED
Message-ID: <0101019ff48e96a6-95dc3972-bc85-4689-876b-375f31ab7106-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 06:00:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243243

--===============2769400230621752582==
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
From ff1f016a9c995f197a22d8371eee745d2e65ccac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 12 Aug 2026 06:00:03 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.6.3 -> 3.7.0

Source: CHANGES.md

3.7.0
 * Add secure memory implementation for Linux and {Net,Open,Free}BSD, MacOS and Windows
 * Update supported CMake version to 3.10
 * doc: use Doxygen-style comments
 * NTG.1 compliance: Modify startup such that the memory access and SHA-3 loop are treated as independent noise sources which are sampled to collect at least 240 bits each before first block of random numbers is released
 * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. This code is already discouraged for a long time. Now it is taken out for good.
 * If cache size cannot be detected from base system (e.g. virtualization), use the requested memory size.
 * Change the stuck test to always calculate the absolute values of the 2nd and 3rd discrete derivation of time.
 * Replace SHA3-256 output generation with XDRBG-256
 * Prune the jitterentropy.h header file of internal definitions and delcarations which are moved to src/jitterentropy-internal.h. With that, jitterentropy.h only contains the API. This modification does not alter the Jitter RNG behavior at all.
 * Update secure storage memory implementation for libgcrypt and OpenSSL
 * Add API jent_status
---
 ...opy_3.6.3.bb => libjitterentropy_3.7.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb => libjitterentropy_3.7.0.bb} (55%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
similarity index 55%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index 776cfe9785..1b688eff6a 100644
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
 HOMEPAGE = "http://www.chronox.de/jent.html"
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


--===============2769400230621752582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 63992 to 84464 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============2769400230621752582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.6.3-3.7.0.patch"

RnJvbSBmZjFmMDE2YTljOTk1ZjE5N2EyMmQ4MzcxZWVlNzQ1ZDJlNjVjY2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTIgQXVnIDIwMjYgMDY6MDA6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNi4zIC0+IDMuNy4wCgpTb3VyY2U6IENIQU5HRVMu
bWQKCjMuNy4wCiAqIEFkZCBzZWN1cmUgbWVtb3J5IGltcGxlbWVudGF0aW9uIGZvciBMaW51eCBh
bmQge05ldCxPcGVuLEZyZWV9QlNELCBNYWNPUyBhbmQgV2luZG93cwogKiBVcGRhdGUgc3VwcG9y
dGVkIENNYWtlIHZlcnNpb24gdG8gMy4xMAogKiBkb2M6IHVzZSBEb3h5Z2VuLXN0eWxlIGNvbW1l
bnRzCiAqIE5URy4xIGNvbXBsaWFuY2U6IE1vZGlmeSBzdGFydHVwIHN1Y2ggdGhhdCB0aGUgbWVt
b3J5IGFjY2VzcyBhbmQgU0hBLTMgbG9vcCBhcmUgdHJlYXRlZCBhcyBpbmRlcGVuZGVudCBub2lz
ZSBzb3VyY2VzIHdoaWNoIGFyZSBzYW1wbGVkIHRvIGNvbGxlY3QgYXQgbGVhc3QgMjQwIGJpdHMg
ZWFjaCBiZWZvcmUgZmlyc3QgYmxvY2sgb2YgcmFuZG9tIG51bWJlcnMgaXMgcmVsZWFzZWQKICog
UmVtb3ZlIGFsbCBjb2RlIHdoZW4gSkVOVF9DT05GX0RJU0FCTEVfTE9PUF9TSFVGRkxFIGlzIHVu
c2V0LiBUaGlzIGNvZGUgaXMgYWxyZWFkeSBkaXNjb3VyYWdlZCBmb3IgYSBsb25nIHRpbWUuIE5v
dyBpdCBpcyB0YWtlbiBvdXQgZm9yIGdvb2QuCiAqIElmIGNhY2hlIHNpemUgY2Fubm90IGJlIGRl
dGVjdGVkIGZyb20gYmFzZSBzeXN0ZW0gKGUuZy4gdmlydHVhbGl6YXRpb24pLCB1c2UgdGhlIHJl
cXVlc3RlZCBtZW1vcnkgc2l6ZS4KICogQ2hhbmdlIHRoZSBzdHVjayB0ZXN0IHRvIGFsd2F5cyBj
YWxjdWxhdGUgdGhlIGFic29sdXRlIHZhbHVlcyBvZiB0aGUgMm5kIGFuZCAzcmQgZGlzY3JldGUg
ZGVyaXZhdGlvbiBvZiB0aW1lLgogKiBSZXBsYWNlIFNIQTMtMjU2IG91dHB1dCBnZW5lcmF0aW9u
IHdpdGggWERSQkctMjU2CiAqIFBydW5lIHRoZSBqaXR0ZXJlbnRyb3B5LmggaGVhZGVyIGZpbGUg
b2YgaW50ZXJuYWwgZGVmaW5pdGlvbnMgYW5kIGRlbGNhcmF0aW9ucyB3aGljaCBhcmUgbW92ZWQg
dG8gc3JjL2ppdHRlcmVudHJvcHktaW50ZXJuYWwuaC4gV2l0aCB0aGF0LCBqaXR0ZXJlbnRyb3B5
Lmggb25seSBjb250YWlucyB0aGUgQVBJLiBUaGlzIG1vZGlmaWNhdGlvbiBkb2VzIG5vdCBhbHRl
ciB0aGUgSml0dGVyIFJORyBiZWhhdmlvciBhdCBhbGwuCiAqIFVwZGF0ZSBzZWN1cmUgc3RvcmFn
ZSBtZW1vcnkgaW1wbGVtZW50YXRpb24gZm9yIGxpYmdjcnlwdCBhbmQgT3BlblNTTAogKiBBZGQg
QVBJIGplbnRfc3RhdHVzCi0tLQogLi4ub3B5XzMuNi4zLmJiID0+IGxpYmppdHRlcmVudHJvcHlf
My43LjAuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliaml0dGVyZW50cm9weS97bGliaml0dGVyZW50cm9weV8zLjYuMy5iYiA9PiBsaWJqaXR0ZXJl
bnRyb3B5XzMuNy4wLmJifSAoNTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVyZW50cm9weV8zLjYuMy5iYiBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVyZW50cm9weV8zLjcuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDU1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0
ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlfMy42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVyZW50cm9weV8zLjcuMC5iYgppbmRl
eCA3NzZjZmU5Nzg1Li4xYjY4OGVmZjZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlfMy42LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5XzMuNy4wLmJi
CkBAIC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBM
SUNFTlNFCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChDKSAyMDE3IC0gMjAyNSwg
U3RlcGhhbiBNdWVsbGVyIDxzbXVlbGxlckBjaHJvbm94LmRlPgorIyArQ29weXJpZ2h0IChDKSAy
MDE3IC0gMjAyNiwgU3RlcGhhbiBNdWVsbGVyIDxzbXVlbGxlckBjaHJvbm94LmRlPgorIyAgCisj
ICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRo
IG9yIHdpdGhvdXQKKyMgIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0
IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucworIyAKKyMKKwogU1VNTUFSWSA9ICJIYXJkd2FyZSBS
TkcgYmFzZWQgb24gQ1BVIHRpbWluZyBqaXR0ZXIiCiBERVNDUklQVElPTiA9ICJUaGUgSml0dGVy
IFJORyBwcm92aWRlcyBhIG5vaXNlIHNvdXJjZSB1c2luZyB0aGUgQ1BVIGV4ZWN1dGlvbiB0aW1p
bmcgaml0dGVyLiBcCiBJdCBkb2VzIG5vdCBkZXBlbmQgb24gYW55IHN5c3RlbSByZXNvdXJjZSBv
dGhlciB0aGFuIGEgaGlnaC1yZXNvbHV0aW9uIHRpbWUgXApAQCAtNSwxMiArMjQsMTIgQEAgc3Rh
bXAuIEl0IGlzIGEgc21hbGwtc2NhbGUsIHlldCBmYXN0IGVudHJvcHkgc291cmNlIHRoYXQgaXMg
dmlhYmxlIGluIGFsbW9zdCBcCiBhbGwgZW52aXJvbm1lbnRzIGFuZCBvbiBhIGxvdCBvZiBDUFUg
YXJjaGl0ZWN0dXJlcy4iCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmNocm9ub3guZGUvamVudC5o
dG1sIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgT1IgR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTAxMDI3YzRhZDFmZTVhNDc2OGY4NDg4Yzk0
NWQ0OTEgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmNhYTJlMmZh
NzdjNGVhMjJlNDViZjc5ZTlhNDEwOTMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5TRS5ncGx2MjttZDU9ZWI3MjNiNjE1MzlmZWVmMDEzZGU0NzZlNjhiNWM1MGEgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5ic2Q7bWQ1PTY2YTVjZWRhZjYyYzRiMjYzNzAy
NWYwNDlmOWI4MjZmIFwKICAgICAgICAgICAgICAgICAgICAgIgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL3NtdWVsbGVyREQvaml0dGVyZW50cm9weS1saWJyYXJ5LmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiYzkwZmY0NjVkY2RiNmE2
OTQ5NTQyYzcyYTI2YThhYjQ5NmRhYThjYiIKK1NSQ1JFViA9ICJlNzgzY2YxYzQ1MGJjZTRkNzJm
OTVjOWY5Yzg0NTQ2YTYwOTQ5NzZhIgogCiBkb19jb25maWd1cmVbbm9leGVjXSA9ICIxIgogCi0t
IAoyLjQ3LjEKCg==

--===============2769400230621752582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy: SRC_URI changed from "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.6.3" to "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.6.3", added "/usr/lib/.debug/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 63992 to 84464 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 4567 to 4643 (+2%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: FILELIST: directory renamed /usr/src/debug/libjitterentropy/3.6.3 -> /usr/src/debug/libjitterentropy/3.7.0, removed "/usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.c", added "/usr/src/debug/libjitterentropy/3.7.0/src
 /jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-status.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-base.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-internal.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-base.c"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============2769400230621752582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-451fe5f7501f2b0f2bf755e28e7524ead5cb143d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:451fe5f7501f2b0f2bf755e28e7524ead5cb143d"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 156 Local 145 Mirrors 0 Missed 11 Current 203 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 288 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 299 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 300 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 302 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 469 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 890 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 328 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running task 891 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_unpack)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 353 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 913 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 357 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 932 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 991 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_deploy_source_date_epoch unihash changed to aa78b87040be713878ef8136378d4e9a89e1cc8d0db840ea48140ef5e5b3435f
NOTE: Setscene tasks completed
NOTE: Running noexec task 997 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_configure)
NOTE: Running task 998 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile)
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
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-base.c:32:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-health.h:23,
|                  from src/jitterentropy-health.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-gcd.h:23,
|                  from src/jitterentropy-gcd.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-status.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-noise.h:23,
|                  from src/jitterentropy-noise.c:21:
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
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-sha3.h:23,
|                  from src/jitterentropy-sha3.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
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
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-timer.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [<builtin>: jitterentropy-gcd.o] Error 1
| make: *** Waiting for unfinished jobs....
| make: *** [<builtin>: jitterentropy-status.o] Error 1
| make: *** [<builtin>: jitterentropy-noise.o] Error 1
| make: *** [<builtin>: jitterentropy-health.o] Error 1
| make: *** [<builtin>: jitterentropy-timer.o] Error 1
| make: *** [<builtin>: jitterentropy-base.o] Error 1
| make: *** [<builtin>: jitterentropy-sha3.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 172
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 157
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 162
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 140
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 134
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072, line 182
NOTE: recipe libjitterentropy-3.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 998 tasks of which 990 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812055951.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812055951.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2800072
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libjitterentropy-3.7.0-r0 do_compile: oe_runmake failed
ERROR: libjitterentropy-3.7.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2800072' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2800072
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile) failed with exit code '1'

--===============2769400230621752582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libjitterentropy-changelog.txt"

Changelog for libjitterentropy: 3.6.3 -> 3.7.0
Source: CHANGES.md

3.7.0
 * Add secure memory implementation for Linux and {Net,Open,Free}BSD, MacOS and Windows
 * Update supported CMake version to 3.10
 * doc: use Doxygen-style comments
 * NTG.1 compliance: Modify startup such that the memory access and SHA-3 loop are treated as independent noise sources which are sampled to collect at least 240 bits each before first block of random numbers is released
 * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. This code is already discouraged for a long time. Now it is taken out for good.
 * If cache size cannot be detected from base system (e.g. virtualization), use the requested memory size.
 * Change the stuck test to always calculate the absolute values of the 2nd and 3rd discrete derivation of time.
 * Replace SHA3-256 output generation with XDRBG-256
 * Prune the jitterentropy.h header file of internal definitions and delcarations which are moved to src/jitterentropy-internal.h. With that, jitterentropy.h only contains the API. This modification does not alter the Jitter RNG behavior at all.
 * Update secure storage memory implementation for libgcrypt and OpenSSL
 * Add API jent_status

--===============2769400230621752582==--

