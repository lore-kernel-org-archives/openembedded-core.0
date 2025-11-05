Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0557DCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2345.1762384574473537591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hCaA4mK8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YD4SlCkR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564e757a-8bc36193-442a-427d-9af3-0e46e6b5692e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DAKMZvCPuY4Y4f+q8j8VoUJxYn1HWhivNJw1Q9Ff5Lo=;
	b=hCaA4mK8WkqE1bP42G6mH09SYGFQCfKCZiFaHOq8nh13/yhGUtCfU/z2+lbzhAfk
	Awr/T/TlG5KUdl0siT2QJK2EkoItgye15cwe88AYVtoqPS14pi3XSzA3HTeRk2qk4Oo
	jR5RQMNQM+/baUaDNgupd300RmmIc+K9/NPl0dq0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DAKMZvCPuY4Y4f+q8j8VoUJxYn1HWhivNJw1Q9Ff5Lo=;
	b=YD4SlCkRmx3Furf2rYZ4qb78bz/bXfLZpVhbzp9R/bkaQYsr8jeYAlhdEQpwOSCn
	C5T9KW3D85dgmR+FswOuWKj8vqrP1pT5xKfUqZ1qDruN296qeb1vmSGyQV0szBiy22s
	ySyOK3kqciefvJ8SgtHg8wUJecsQjlU6aqP+z1IU=
Content-Type: multipart/mixed; boundary="===============6054821526015084855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xeyes: upgrading to 1.3.1 SUCCEEDED
Message-ID: <0101019a564e757a-8bc36193-442a-427d-9af3-0e46e6b5692e-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225788

--===============6054821526015084855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xeyes* to *1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xeyes-upgrade-1.3.0-1.3.1.patch
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
From 3940ff444d35470e8ff1daa25f42f5cbf646836b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 13:41:01 +0000
Subject: [PATCH] xeyes: upgrade 1.3.0 -> 1.3.1

---
 .../{xeyes_1.3.0.bb => xeyes_1.3.1.bb}        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.3.0.bb => xeyes_1.3.1.bb} (29%)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
similarity index 29%
rename from meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
index 3d1a7063ea..1ded6d8e16 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
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
+# @@ -1,4 +1,5 @@
+#  Copyright (c) 1991  X Consortium
+# +Copyright (c) 2023  q3k
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining
+#  a copy of this software and associated documentation files (the
+# 
+#
+
 require xorg-app-common.inc
 
 SUMMARY = "X11 eyes that follow the mouse cursor demo"
@@ -6,9 +25,9 @@ follow the location of the mouse cursor around the screen."
 
 PE = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=29277094da1ef0646d5634a79cb0c1c5"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0950c600bf33447e169a539ee6655ef9f36d6cebf2c1be67f7ab55dacb753023"
+SRC_URI[sha256sum] = "5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender libxi"
-- 
2.47.1


--===============6054821526015084855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xeyes-upgrade-1.3.0-1.3.1.patch"

RnJvbSAzOTQwZmY0NDRkMzU0NzBlOGZmMWRhYTI1ZjQyZjVjYmY2NDY4MzZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMzo0MTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhl
eWVzOiB1cGdyYWRlIDEuMy4wIC0+IDEuMy4xCgotLS0KIC4uLi97eGV5ZXNfMS4zLjAuYmIgPT4g
eGV5ZXNfMS4zLjEuYmJ9ICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGV5ZXNfMS4zLjAuYmIgPT4geGV5ZXNfMS4zLjEuYmJ9
ICgyOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVz
XzEuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVzXzEuMy4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggMjklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94ZXllc18xLjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctYXBwL3hleWVzXzEuMy4xLmJiCmluZGV4IDNkMWE3MDYzZWEuLjFkZWQ2ZDhlMTYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXllc18xLjMuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV5ZXNfMS4zLjEuYmIKQEAgLTEsMyAr
MSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMg
QEAgLTEsNCArMSw1IEBACisjICBDb3B5cmlnaHQgKGMpIDE5OTEgIFggQ29uc29ydGl1bQorIyAr
Q29weXJpZ2h0IChjKSAyMDIzICBxM2sKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3Jh
bnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nCisjICBhIGNvcHkg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUK
KyMgCisjCisKIHJlcXVpcmUgeG9yZy1hcHAtY29tbW9uLmluYwogCiBTVU1NQVJZID0gIlgxMSBl
eWVzIHRoYXQgZm9sbG93IHRoZSBtb3VzZSBjdXJzb3IgZGVtbyIKQEAgLTYsOSArMjUsOSBAQCBm
b2xsb3cgdGhlIGxvY2F0aW9uIG9mIHRoZSBtb3VzZSBjdXJzb3IgYXJvdW5kIHRoZSBzY3JlZW4u
IgogCiBQRSA9ICIxIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0z
ZWE1MWIzNjUwNTFhYzMyZDE4MTNhN2RiYWE0YmZjNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTI5Mjc3MDk0ZGExZWYwNjQ2ZDU2MzRhNzljYjBjMWM1IgogCiBTUkNf
VVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOTUwYzYwMGJmMzM0NDdlMTY5
YTUzOWVlNjY1NWVmOWYzNmQ2Y2ViZjJjMWJlNjdmN2FiNTVkYWNiNzUzMDIzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjU2MDhkNzZiN2IxYWFjNWVkN2YyMmYxYjZiNWFkNzRlZjk4Yzg2OTMyMjBm
MzJiNGI4N2RjY2VlNGE5NTZlYWEiCiAKIERFUEVORFMgKz0gImxpYnhhdSBsaWJ4dCBsaWJ4ZXh0
IGxpYnhtdSBsaWJ4cmVuZGVyIGxpYnhpIgotLSAKMi40Ny4xCgo=

--===============6054821526015084855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes: SRC_URI changed from "https://www.x.org/releases//individual/app/xeyes-1.3.0.tar.xz" to "https://www.x.org/releases//individual/app/xeyes-1.3.1.tar.xz"
packages/x86-64-v3-poky-linux/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-dbg: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-dev: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGSIZE changed from 1864 to 1885 (+1%)
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]

--===============6054821526015084855==--

