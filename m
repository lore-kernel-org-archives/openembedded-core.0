Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2069CDB477
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50621.1781195513928724445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ufXFsyZc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ld1Rvpul;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb7869e07-75f8fab8-4670-4bca-9d76-762928ea3aff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=txbgYBPGOGb+cfk3tAc8dZxocB/d1Yf/RVqRrHHP+F8=;
	b=ufXFsyZcdFkG8w9NyOse5kUS0jXySxrwyStDxwiwLzcYeVL6VVxHhk0S3DuqIWpN
	89lFaDZEYmz/O21p1Uj91ZYDKRQvlN6+jql3zGEGtUvZ0Dpli/hpX8n4TzTnF5CEOdH
	mPLqzTHjtpRgX5jtLnuJWLOIaB5owSrZwtC+ArSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=txbgYBPGOGb+cfk3tAc8dZxocB/d1Yf/RVqRrHHP+F8=;
	b=ld1Rvpul9WRR8UoE2ys0Tsy0ZVk68+a71ZtfqOOuiLHyt/PfIQjGKqyLTaGfwWj/
	j2e/Wle3UgV5t0CnmeTJut3TNJ7NoUXxt7W08ZTieofFsoQnFB2biZSG90kWequl9NB
	ULKheeC/7lLionbcpzITTkgNksBIal/qogU5Lf4g=
Content-Type: multipart/mixed; boundary="===============8359538865782036197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] which: upgrading to 2.25 SUCCEEDED
Message-ID: <0101019eb7869e07-75f8fab8-4670-4bca-9d76-762928ea3aff-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238524

--===============8359538865782036197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *which* to *2.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-which-upgrade-2.23-2.25.patch
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
From a2728152c5879934a2de0708c4467bd754815d75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:40:57 +0000
Subject: [PATCH] which: upgrade 2.23 -> 2.25

---
 ...opt-Fix-signature-of-getenv-function.patch |  2 +-
 .../{which-2.23 => which-2.25}/meson.build    |  0
 .../which/{which_2.23.bb => which_2.25.bb}    | 28 +++++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/0001-getopt-Fix-signature-of-getenv-function.patch (96%)
 rename meta/recipes-extended/which/{which-2.23 => which-2.25}/meson.build (100%)
 rename meta/recipes-extended/which/{which_2.23.bb => which_2.25.bb} (48%)

diff --git a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
similarity index 96%
rename from meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
rename to meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
index c54368a084..457d11fb44 100644
--- a/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
+++ b/meta/recipes-extended/which/which-2.25/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -1,4 +1,4 @@
-From 83d2ed3fd203868a8f287d2ebedc7c304c74fbb4 Mon Sep 17 00:00:00 2001
+From 3b823f4fbd3135c27287621ee3c315ae5975382d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Mar 2025 17:56:19 -0700
 Subject: [PATCH] getopt: Fix signature of getenv function
diff --git a/meta/recipes-extended/which/which-2.23/meson.build b/meta/recipes-extended/which/which-2.25/meson.build
similarity index 100%
rename from meta/recipes-extended/which/which-2.23/meson.build
rename to meta/recipes-extended/which/which-2.25/meson.build
diff --git a/meta/recipes-extended/which/which_2.23.bb b/meta/recipes-extended/which/which_2.25.bb
similarity index 48%
rename from meta/recipes-extended/which/which_2.23.bb
rename to meta/recipes-extended/which/which_2.25.bb
index 0bbc3510d8..18ed9e6268 100644
--- a/meta/recipes-extended/which/which_2.23.bb
+++ b/meta/recipes-extended/which/which_2.25.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- which.c
+# +++ which.c
+# @@ -1,6 +1,6 @@
+#  /*
+#   * which v2.x -- print full path of executables
+# - * Copyright (C) 1999, 2003, 2007, 2008  Carlo Wood <carlo@gnu.org>
+# + * Copyright (C) 1999, 2003, 2007, 2008, 2024, 2026  Carlo Wood <carlo@gnu.org>
+#   *
+#   * This program is free software: you can redistribute it and/or modify
+#   * it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "Displays the full path of shell commands"
 DESCRIPTION = "Which is a utility that prints out the full path of the \
 executables that bash(1) would execute when the passed \
@@ -7,8 +28,9 @@ SECTION = "libs"
 HOMEPAGE = "https://carlowood.github.io/which/"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://which.c;beginline=1;endline=17;md5=bcd173cbf5381e10d43be8d6ca6da3b5 \
+                    "
 
 inherit meson update-alternatives
 
@@ -17,7 +39,7 @@ SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[sha256sum] = "a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73"
+SRC_URI[sha256sum] = "1cb83e4f702e60b8211ab5ec4c2afbab1b1dec80209456a7d2faf7584ed225ea"
 
 do_configure:prepend() {
        cp ${UNPACKDIR}/meson.build ${S}
-- 
2.47.1


--===============8359538865782036197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/which: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/which/which-2.23.tar.gz file://meson.build file://0001-getopt-Fix-signature-of-getenv-function.patch" to "https://ftpmirror.gnu.org/gnu/which/which-2.25.tar.gz file://meson.build file://0001-getopt-Fix-signature-of-getenv-function.patch"
packages/x86-64-v3-poky-linux/which: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-dbg: PKGSIZE changed from 76720 to 76232 (-1%)
packages/x86-64-v3-poky-linux/which/which-dbg: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-dbg: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-dev: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-dev: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-doc: PKGSIZE changed from 3639 to 3643 (+0%)
packages/x86-64-v3-poky-linux/which/which-doc: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-doc: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-locale: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-locale: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-src: PKGSIZE changed from 58660 to 59018 (+1%)
packages/x86-64-v3-poky-linux/which/which-src: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-src: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which-src: FILELIST: directory renamed /usr/src/debug/which/2.23 -> /usr/src/debug/which/2.25
packages/x86-64-v3-poky-linux/which/which-staticdev: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which-staticdev: PKGV changed from 2.23 [default] to 2.25 [default]
packages/x86-64-v3-poky-linux/which/which: PV changed from "2.23" to "2.25"
packages/x86-64-v3-poky-linux/which/which: PKGV changed from 2.23 [default] to 2.25 [default]

--===============8359538865782036197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-which-upgrade-2.23-2.25.patch"

RnJvbSBhMjcyODE1MmM1ODc5OTM0YTJkZTA3MDhjNDQ2N2JkNzU0ODE1ZDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6NDA6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aGljaDogdXBncmFkZSAyLjIzIC0+IDIuMjUKCi0tLQogLi4ub3B0LUZpeC1zaWduYXR1cmUtb2Yt
Z2V0ZW52LWZ1bmN0aW9uLnBhdGNoIHwgIDIgKy0KIC4uLi97d2hpY2gtMi4yMyA9PiB3aGljaC0y
LjI1fS9tZXNvbi5idWlsZCAgICB8ICAwCiAuLi4vd2hpY2gve3doaWNoXzIuMjMuYmIgPT4gd2hp
Y2hfMi4yNS5iYn0gICAgfCAyOCArKysrKysrKysrKysrKysrKy0tCiAzIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3doaWNoL3t3aGljaC0yLjIzID0+IHdoaWNoLTIuMjV9LzAwMDEtZ2V0b3B0LUZpeC1z
aWduYXR1cmUtb2YtZ2V0ZW52LWZ1bmN0aW9uLnBhdGNoICg5NiUpCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3doaWNoL3t3aGljaC0yLjIzID0+IHdoaWNoLTIuMjV9L21lc29uLmJ1aWxk
ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC97d2hpY2hfMi4yMy5i
YiA9PiB3aGljaF8yLjI1LmJifSAoNDglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC93aGljaC93aGljaC0yLjIzLzAwMDEtZ2V0b3B0LUZpeC1zaWduYXR1cmUtb2YtZ2V0ZW52
LWZ1bmN0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3doaWNoLTIuMjUv
MDAwMS1nZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0Y2gKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3do
aWNoLTIuMjMvMDAwMS1nZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0
Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaC0yLjI1LzAwMDEt
Z2V0b3B0LUZpeC1zaWduYXR1cmUtb2YtZ2V0ZW52LWZ1bmN0aW9uLnBhdGNoCmluZGV4IGM1NDM2
OGEwODQuLjQ1N2QxMWZiNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93aGlj
aC93aGljaC0yLjIzLzAwMDEtZ2V0b3B0LUZpeC1zaWduYXR1cmUtb2YtZ2V0ZW52LWZ1bmN0aW9u
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaC0yLjI1LzAwMDEt
Z2V0b3B0LUZpeC1zaWduYXR1cmUtb2YtZ2V0ZW52LWZ1bmN0aW9uLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA4M2QyZWQzZmQyMDM4NjhhOGYyODdkMmViZWRjN2MzMDRjNzRmYmI0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzYjgyM2Y0ZmJkMzEzNWMyNzI4NzYyMWVlM2MzMTVh
ZTU5NzUzODJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMjIgTWFyIDIwMjUgMTc6NTY6MTkgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gZ2V0b3B0OiBGaXggc2lnbmF0dXJlIG9mIGdldGVudiBmdW5jdGlvbgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3doaWNoL3doaWNoLTIuMjMvbWVzb24u
YnVpbGQgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2gtMi4yNS9tZXNvbi5idWls
ZApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3doaWNoL3doaWNoLTIuMjMvbWVzb24uYnVpbGQKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC93aGljaC93aGljaC0yLjI1L21lc29uLmJ1aWxkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2hfMi4yMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93
aGljaC93aGljaF8yLjI1LmJiCnNpbWlsYXJpdHkgaW5kZXggNDglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC93aGljaC93aGljaF8yLjIzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2hfMi4yNS5iYgppbmRleCAwYmJjMzUxMGQ4Li4xOGVkOWU2
MjY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2hfMi4yMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2hpY2gvd2hpY2hfMi4yNS5iYgpAQCAtMSwz
ICsxLDI0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gd2hpY2guYworIyArKysgd2hpY2guYwor
IyBAQCAtMSw2ICsxLDYgQEAKKyMgIC8qCisjICAgKiB3aGljaCB2Mi54IC0tIHByaW50IGZ1bGwg
cGF0aCBvZiBleGVjdXRhYmxlcworIyAtICogQ29weXJpZ2h0IChDKSAxOTk5LCAyMDAzLCAyMDA3
LCAyMDA4ICBDYXJsbyBXb29kIDxjYXJsb0BnbnUub3JnPgorIyArICogQ29weXJpZ2h0IChDKSAx
OTk5LCAyMDAzLCAyMDA3LCAyMDA4LCAyMDI0LCAyMDI2ICBDYXJsbyBXb29kIDxjYXJsb0BnbnUu
b3JnPgorIyAgICoKKyMgICAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICAgKiBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorIyAKKyMK
KwogU1VNTUFSWSA9ICJEaXNwbGF5cyB0aGUgZnVsbCBwYXRoIG9mIHNoZWxsIGNvbW1hbmRzIgog
REVTQ1JJUFRJT04gPSAiV2hpY2ggaXMgYSB1dGlsaXR5IHRoYXQgcHJpbnRzIG91dCB0aGUgZnVs
bCBwYXRoIG9mIHRoZSBcCiBleGVjdXRhYmxlcyB0aGF0IGJhc2goMSkgd291bGQgZXhlY3V0ZSB3
aGVuIHRoZSBwYXNzZWQgXApAQCAtNyw4ICsyOCw5IEBAIFNFQ1RJT04gPSAibGlicyIKIEhPTUVQ
QUdFID0gImh0dHBzOi8vY2FybG93b29kLmdpdGh1Yi5pby93aGljaC8iCiAKIExJQ0VOU0UgPSAi
R1BMLTMuMC1vci1sYXRlciIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0XAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vd2hpY2guYztiZWdpbmxpbmU9MTtlbmRsaW5lPTE3O21kNT1hOTk2MzY5M2FmMjI3MmU3
YThkZjZmMjMxMTY0ZTdhMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0IFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3doaWNoLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0xNzttZDU9YmNkMTczY2JmNTM4MWUx
MGQ0M2JlOGQ2Y2E2ZGEzYjUgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIGluaGVyaXQgbWVz
b24gdXBkYXRlLWFsdGVybmF0aXZlcwogCkBAIC0xNyw3ICszOSw3IEBAIFNSQ19VUkkgPSAiJHtH
TlVfTUlSUk9SfS93aGljaC93aGljaC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1nZXRvcHQtRml4LXNpZ25hdHVyZS1vZi1nZXRlbnYtZnVuY3Rpb24ucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMmM1NTgyMjZmYzRkOWU0Y2UzMzFi
ZDJmZDNjM2YxN2Y5NTUxMTVkMmMwMGU0NDc2MThhNGVmOTk3OGEyYTczIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFjYjgzZTRmNzAyZTYwYjgyMTFhYjVlYzRjMmFmYmFiMWIxZGVjODAyMDk0NTZh
N2QyZmFmNzU4NGVkMjI1ZWEiCiAKIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogICAgICAgIGNw
ICR7VU5QQUNLRElSfS9tZXNvbi5idWlsZCAke1N9Ci0tIAoyLjQ3LjEKCg==

--===============8359538865782036197==--

