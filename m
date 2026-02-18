Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C430CC531E3
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1391.1771440099913837195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tPxJU7qn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pp+ACYmH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720eef19-1f0dbf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=75YoSRanoqd7Zo5RLw0oALLX0jqL9HevSdHnqRhnXiY=;
	b=tPxJU7qnqdIPYwMV5+DKn+P0gbXrMZpvXdiMHFr4V02NXV/W9zJ0U0sjQRUgCSyQ
	yX0kf1qii7XXbKOHuS/ahBx3PGiSHaFZTofGaI6zbyFWkMZf/djLn3o3AqRWQ/PHsmm
	QphqX18c4HCmGdTuhI9UKzjjjvZCW7LCmOS7ZLg8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=75YoSRanoqd7Zo5RLw0oALLX0jqL9HevSdHnqRhnXiY=;
	b=pp+ACYmH2C/3DnWWfCR6b7Q6cm8cZFG3eTmCl9uxHVyO5zXQgb8UgjNvx8gp55za
	5CKG5GiO1GFFElkZpHdedY66S7m+e2Sg9FbbWafCcqIpiNilUZ3+XUksyH5WpB4vbGB
	0xxiL7/aO3Ru4mTscYh4t1JCosPubM0+xSdJ2aGg=
Content-Type: multipart/mixed; boundary="===============0963535600073331896=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 692 SUCCEEDED
Message-ID: <0101019c720eef19-1f0dbf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231370

--===============0963535600073331896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *692* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-691-692.patch
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
From d5054bac9c66612543f7e75a10fd423483993be6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:37:19 +0000
Subject: [PATCH] less: upgrade 691 -> 692

---
 .../less/{less_691.bb => less_692.bb}         | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_691.bb => less_692.bb} (66%)

diff --git a/meta/recipes-extended/less/less_691.bb b/meta/recipes-extended/less/less_692.bb
similarity index 66%
rename from meta/recipes-extended/less/less_691.bb
rename to meta/recipes-extended/less/less_692.bb
index 8354dc4486..7b058947ae 100644
--- a/meta/recipes-extended/less/less_691.bb
+++ b/meta/recipes-extended/less/less_692.bb
@@ -1,3 +1,25 @@
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
+# @@ -2,7 +2,7 @@
+#                            ------------
+#  
+#  Less
+# -Copyright (C) 1984-2025  Mark Nudelman
+# +Copyright (C) 1984-2026  Mark Nudelman
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Text file viewer similar to more"
 DESCRIPTION = "Less is a program similar to more, i.e. a terminal \
 based program for viewing text files and the output from other \
@@ -21,7 +43,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=8051a271adb36d1462531a3b40c22878 \
+                    file://LICENSE;md5=bee5763a5e2bccdcdbd9bfe982ffc82b \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +51,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25"
+SRC_URI[sha256sum] = "61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============0963535600073331896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/less: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-691.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-692.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/less: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-dbg: PKGSIZE changed from 950888 to 953488 (+0%)
packages/x86-64-v3-poky-linux/less/less-dbg: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-dev: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-dev: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-doc: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-doc: PKGSIZE changed from 127089 to 127651 (+0%)
packages/x86-64-v3-poky-linux/less/less-doc: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-locale: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-locale: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-src: FILELIST: directory renamed /usr/src/debug/less/691/lesstest -> /usr/src/debug/less/692/lesstest, directory renamed /usr/src/debug/less/691 -> /usr/src/debug/less/692
packages/x86-64-v3-poky-linux/less/less-src: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-src: PKGSIZE changed from 915692 to 920816 (+1%)
packages/x86-64-v3-poky-linux/less/less-src: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less-staticdev: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less-staticdev: PV changed from "691" to "692"
packages/x86-64-v3-poky-linux/less/less: PKGV changed from 691 [default] to 692 [default]
packages/x86-64-v3-poky-linux/less/less: PV changed from "691" to "692"

--===============0963535600073331896==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-691-692.patch"

RnJvbSBkNTA1NGJhYzljNjY2MTI1NDNmN2U3NWExMGZkNDIzNDgzOTkzYmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6Mzc6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDY5MSAtPiA2OTIKCi0tLQogLi4uL2xlc3Mve2xlc3NfNjkxLmJiID0+IGxl
c3NfNjkyLmJifSAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xlc3Mve2xlc3NfNjkxLmJiID0+IGxlc3NfNjkyLmJifSAoNjYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkxLmJiIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xlc3MvbGVzc182OTIuYmIKc2ltaWxhcml0eSBpbmRleCA2NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182OTEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkyLmJiCmluZGV4IDgzNTRkYzQ0ODYuLjdi
MDU4OTQ3YWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkx
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkyLmJiCkBAIC0xLDMg
KzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4g
dXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVh
c2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUg
Y2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRh
Zy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQu
JykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisj
IEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0t
LS0KKyMgIAorIyAgTGVzcworIyAtQ29weXJpZ2h0IChDKSAxOTg0LTIwMjUgIE1hcmsgTnVkZWxt
YW4KKyMgK0NvcHlyaWdodCAoQykgMTk4NC0yMDI2ICBNYXJrIE51ZGVsbWFuCisjICAKKyMgIFJl
ZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Ig
d2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhl
IGZvbGxvd2luZyBjb25kaXRpb25zCisjIAorIworCiBTVU1NQVJZID0gIlRleHQgZmlsZSB2aWV3
ZXIgc2ltaWxhciB0byBtb3JlIgogREVTQ1JJUFRJT04gPSAiTGVzcyBpcyBhIHByb2dyYW0gc2lt
aWxhciB0byBtb3JlLCBpLmUuIGEgdGVybWluYWwgXAogYmFzZWQgcHJvZ3JhbSBmb3Igdmlld2lu
ZyB0ZXh0IGZpbGVzIGFuZCB0aGUgb3V0cHV0IGZyb20gb3RoZXIgXApAQCAtMjEsNyArNDMsNyBA
QCBTRUNUSU9OID0gImNvbnNvbGUvdXRpbHMiCiAKIExJQ0VOU0UgPSAiR1BMLTMuMC1vci1sYXRl
ciB8IEJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTFlYmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRlNDQwNDY0IFwKLSAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL0xJQ0VOU0U7bWQ1PTgwNTFhMjcxYWRiMzZkMTQ2MjUzMWEzYjQwYzIyODc4IFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0U7bWQ1PWJlZTU3NjNhNWUyYmNjZGNkYmQ5
YmZlOTgyZmZjODJiIFwKICAgICAgICAgICAgICAgICAgICAgIgogREVQRU5EUyA9ICJuY3Vyc2Vz
IgogCkBAIC0yOSw3ICs1MSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0
d2FyZS5jb20vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODhiNDgw
ZWRhMWJiNGY5MjAwOWY3OTY4YjIzMTg5ZWFmMTMyOTIxMWY1YTM1MTU4NjllMTMzZDI4NjE1NGQy
NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MTMwMGY2MDM3OThlY2YxZDc3ODY1NzA3ODlmMGZm
M2Y1YTFhY2YwNzVhNmZiOWY3NTY4MzdkMTY2ZTM3ZDE0IgogCiBVUFNUUkVBTV9DSEVDS19VUkkg
PSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vbGVzcy9kb3dubG9hZC5odG1sIgog
Ci0tIAoyLjQ3LjEKCg==

--===============0963535600073331896==--

