Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2EBCAC59C
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.30883.1757937275830919196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Qgma8PFE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c5Erh5dD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101994d3a1077-df192051-fd6a-4b49-a70a-8c70ab1b1294-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=twLHittzLi8PERVaeGAKgFQLOifyfVgF+gP2LTvlCYg=;
	b=Qgma8PFE+uc/vbbc8dilOix6inOYfj3e6+SmwlnqAQC1C/knFc/VRF46N4tQebn4
	arhnfU1SV6MVic+AZVsSbkNbO+HqBUn1Zw6tAZ0ju2RVC28BwbUsS174PK+/K4rBOqu
	XhIgIi+++9Rv/+LaxhB9TxL19IedkSRqb57SSMfA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=twLHittzLi8PERVaeGAKgFQLOifyfVgF+gP2LTvlCYg=;
	b=c5Erh5dDkhvcozurLM5aKO+SWHYv6LIS8e92zCTyBAeGjfHlF3Us4A9KB8Rugs2h
	L9eqP5inkl+3uFT4DniLPZsh1bYiab2LG1sZnqb0OjZvLawwY26WARrrKp9VFJ8cAlD
	hQtFh3ynqFxNFLTkIBHpREJY/rf4YRnTmZ3/JSbU=
Content-Type: multipart/mixed; boundary="===============5626801393933603409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xeyes: upgrading to 1.3.1 SUCCEEDED
Message-ID: <010101994d3a1077-df192051-fd6a-4b49-a70a-8c70ab1b1294-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223407

--===============5626801393933603409==
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
From b5fa7a0b6e5891487c96f7e27591a24cb9fd9be5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 06:54:46 +0000
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


--===============5626801393933603409==
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
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGSIZE changed from 1864 to 1885 (+1%)
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/x86-64-v3-poky-linux/xeyes/xeyes: PV changed from "1.3.0" to "1.3.1"
packages/x86-64-v3-poky-linux/xeyes/xeyes: PKGV changed from 1.3.0 [default] to 1.3.1 [default]

--===============5626801393933603409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xeyes-upgrade-1.3.0-1.3.1.patch"

RnJvbSBiNWZhN2EwYjZlNTg5MTQ4N2M5NmY3ZTI3NTkxYTI0Y2I5ZmQ5YmU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDY6NTQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ZXllczogdXBncmFkZSAxLjMuMCAtPiAxLjMuMQoKLS0tCiAuLi4ve3hleWVzXzEuMy4wLmJiID0+
IHhleWVzXzEuMy4xLmJifSAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hleWVzXzEuMy4wLmJiID0+IHhleWVzXzEuMy4xLmJi
fSAoMjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXll
c18xLjMuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXllc18xLjMuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDI5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAveGV5ZXNfMS4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94ZXllc18xLjMuMS5iYgppbmRleCAzZDFhNzA2M2VhLi4xZGVkNmQ4ZTE2IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV5ZXNfMS4zLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hleWVzXzEuMy4xLmJiCkBAIC0xLDMg
KzEsMjIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4g
dXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVh
c2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUg
Y2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRh
Zy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQu
JykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisj
IEBAIC0xLDQgKzEsNSBAQAorIyAgQ29weXJpZ2h0IChjKSAxOTkxICBYIENvbnNvcnRpdW0KKyMg
K0NvcHlyaWdodCAoYykgMjAyMyAgcTNrCisjICAKKyMgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdy
YW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZworIyAgYSBjb3B5
IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhl
CisjIAorIworCiByZXF1aXJlIHhvcmctYXBwLWNvbW1vbi5pbmMKIAogU1VNTUFSWSA9ICJYMTEg
ZXllcyB0aGF0IGZvbGxvdyB0aGUgbW91c2UgY3Vyc29yIGRlbW8iCkBAIC02LDkgKzI1LDkgQEAg
Zm9sbG93IHRoZSBsb2NhdGlvbiBvZiB0aGUgbW91c2UgY3Vyc29yIGFyb3VuZCB0aGUgc2NyZWVu
LiIKIAogUEUgPSAiMSIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
M2VhNTFiMzY1MDUxYWMzMmQxODEzYTdkYmFhNGJmYzYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT0yOTI3NzA5NGRhMWVmMDY0NmQ1NjM0YTc5Y2IwYzFjNSIKIAogU1JD
X1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDk1MGM2MDBiZjMzNDQ3ZTE2
OWE1MzllZTY2NTVlZjlmMzZkNmNlYmYyYzFiZTY3ZjdhYjU1ZGFjYjc1MzAyMyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NjA4ZDc2YjdiMWFhYzVlZDdmMjJmMWI2YjVhZDc0ZWY5OGM4NjkzMjIw
ZjMyYjRiODdkY2NlZTRhOTU2ZWFhIgogCiBERVBFTkRTICs9ICJsaWJ4YXUgbGlieHQgbGlieGV4
dCBsaWJ4bXUgbGlieHJlbmRlciBsaWJ4aSIKLS0gCjIuNDcuMQoK

--===============5626801393933603409==--

