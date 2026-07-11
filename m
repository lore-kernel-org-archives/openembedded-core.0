Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D24C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 06:06:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.261.1783749983254235668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 23:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Uj3CPr4g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WayiAJU2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f4fc8b8bf-5a69b3e5-222a-45cb-b93c-00f049519de9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783749982;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=A3fFyAhE4nNXQuk8Fb6JXAGud3HpnoviQXkdlVwiwL8=;
	b=Uj3CPr4g3e39PPXPB8vPv0+AkJgdx61g/UCwNhyDgGge7faapMei9PXZ3iy03StJ
	7MufoH8Py9WIgGXcpRfBNnp13itlK6cmrE6GA/d9ASz4oJJ/rep2qBWZzwzZ9BXMY+C
	Wyo3XojlQQzz9rl8SMBFvC6PpnETeMy5B9x3ujmQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783749982;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=A3fFyAhE4nNXQuk8Fb6JXAGud3HpnoviQXkdlVwiwL8=;
	b=WayiAJU23xVhDMVv443LET3Wg11YOroI1mKdRBTlISLA+ULHN9JsoqGUKEbM5X2H
	sXWeDOLc61IIk4d/8Ex6lxpS8ekN+o6hT9QuwFL0MKt6KHT2i+G5KKL05RIQq2ikxJ4
	rdqxWetJFC36yJ/nMV39GXM5TaRU5xNLOVB0f7D8=
Content-Type: multipart/mixed; boundary="===============6021272895528234566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libffi: upgrading to 3.7.1 SUCCEEDED
Message-ID: <0101019f4fc8b8bf-5a69b3e5-222a-45cb-b93c-00f049519de9-000000@us-west-2.amazonses.com>
Date: Sat, 11 Jul 2026 06:06:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 06:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240707

--===============6021272895528234566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.6.0-3.7.1.patch
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
From 43bdaa6de10faefa1faeadb9086dbdfb6282ba93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 11 Jul 2026 05:53:04 +0000
Subject: [PATCH] libffi: upgrade 3.6.0 -> 3.7.1

---
 .../libffi/libffi/not-win32.patch             |  6 ++---
 .../{libffi_3.6.0.bb => libffi_3.7.1.bb}      | 23 +++++++++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.6.0.bb => libffi_3.7.1.bb} (61%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 17f45456ad..1f77db2fe0 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From b89a6b1ebfde657a8ff3c325297caf2bfbd1f7f4 Mon Sep 17 00:00:00 2001
+From 3b0ec51416b341cdb681796bd52dfe86d0d9bea0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2c8ba77..4e92515 100644
+index 3370acc..2f96c6f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -423,7 +423,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -429,7 +429,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.6.0.bb b/meta/recipes-support/libffi/libffi_3.7.1.bb
similarity index 61%
rename from meta/recipes-support/libffi/libffi_3.6.0.bb
rename to meta/recipes-support/libffi/libffi_3.7.1.bb
index 8868279d6a..0b35618b9b 100644
--- a/meta/recipes-support/libffi/libffi_3.6.0.bb
+++ b/meta/recipes-support/libffi/libffi_3.7.1.bb
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
+# -libffi - Copyright (c) 1996-2025  Anthony Green, Red Hat, Inc and others.
+# +libffi - Copyright (c) 1996-2026  Anthony Green, Red Hat, Inc and others.
+#  See source files for details.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining
+# 
+#
+
 SUMMARY = "A portable foreign function interface library"
 HOMEPAGE = "http://sourceware.org/libffi/"
 DESCRIPTION = "The `libffi' library provides a portable, high level programming interface to various calling \
@@ -8,12 +27,12 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5e9a8df556846bb3d1edec0d968a2311"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "31ff1fe32deaebfbb388727f32677bb254bf2a41382c51464c0b1837c9ee9828"
+SRC_URI[sha256sum] = "d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============6021272895528234566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.3.1", added "/usr/lib/libffi.so.8.4.1"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 67711 to 75903 (+12%)
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so.8.3.1 moved to /usr/lib/libffi.so.8.4.1
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so.8.3.1 moved to /usr/lib/libffi.so.8.4.1

--===============6021272895528234566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libffi: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.6.0/libffi-3.6.0.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.7.1/libffi-3.7.1.tar.gz file://not-win32.patch"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: FILELIST: removed "/usr/lib/.debug/libffi.so.8.3.1", added "/usr/lib/.debug/libffi.so.8.4.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 182632 to 194872 (+7%)
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGSIZE changed from 21032 to 21967 (+4%)
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGSIZE changed from 46477 to 49152 (+6%)
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: FILELIST: directory renamed /usr/src/debug/libffi/3.6.0/src/x86 -> /usr/src/debug/libffi/3.7.1/src/x86, directory renamed /usr/src/debug/libffi/3.6.0/include -> /usr/src/debug/libffi/3.7.1/include, directory renamed /usr/src/debug/libffi/3.6.0/src -> /usr/src/debug/libffi/3.7.1/src
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 367981 to 383531 (+4%)
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: PV changed from "3.6.0" to "3.7.1"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGV changed from 3.6.0 [default] to 3.7.1 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.3.1", added "/usr/lib/libffi.so.8.4.1"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 67711 to 75903 (+12%)
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so.8.3.1 moved to /usr/lib/libffi.so.8.4.1
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.3.1 to libffi.so.8.4.1
  /usr/lib/libffi.so.8.3.1 moved to /usr/lib/libffi.so.8.4.1

--===============6021272895528234566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.6.0-3.7.1.patch"

RnJvbSA0M2JkYWE2ZGUxMGZhZWZhMWZhZWFkYjkwODZkYmRmYjYyODJiYTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTEgSnVsIDIwMjYgMDU6NTM6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmZmk6IHVwZ3JhZGUgMy42LjAgLT4gMy43LjEKCi0tLQogLi4uL2xpYmZmaS9saWJmZmkvbm90
LXdpbjMyLnBhdGNoICAgICAgICAgICAgIHwgIDYgKystLS0KIC4uLi97bGliZmZpXzMuNi4wLmJi
ID0+IGxpYmZmaV8zLjcuMS5iYn0gICAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJmZmkve2xpYmZmaV8zLjYuMC5iYiA9PiBsaWJmZmlfMy43LjEu
YmJ9ICg2MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZm
aS9ub3Qtd2luMzIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25v
dC13aW4zMi5wYXRjaAppbmRleCAxN2Y0NTQ1NmFkLi4xZjc3ZGIyZmUwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYjg5YTZiMWViZmRlNjU3YThmZjNjMzI1Mjk3Y2FmMmJmYmQxZjdmNCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2IwZWM1MTQxNmIzNDFjZGI2ODE3OTZiZDUy
ZGZlODZkMGQ5YmVhMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUsIDQgRmViIDIwMTYgMTY6MjI6NTAg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZmZpOiBlbnN1cmUgc3lzcm9vdCBwYXRocyBhcmUg
bm90IGluIGxpYmZmaS5wYwpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKLWluZGV4IDJjOGJhNzcuLjRlOTI1MTUgMTAwNjQ0CitpbmRleCAzMzcwYWNjLi4y
Zjk2YzZmIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBA
IC00MjMsNyArNDIzLDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3RvcnksCitAQCAt
NDI5LDcgKzQyOSw3IEBAIEFDX0FSR19FTkFCTEUobXVsdGktb3MtZGlyZWN0b3J5LAogIAogICMg
VGhlc2UgdmFyaWFibGVzIGFyZSBvbmx5IGV2ZXIgdXNlZCB3aGVuIHdlIGNyb3NzLWJ1aWxkIHRv
IFg4Nl9XSU4zMi4KICAjIEFuZCB3ZSBvbmx5IHN1cHBvcnQgdGhpcyB3aXRoIEdDQywgc28uLi4K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy42LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNy4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggNjElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlf
My42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy43
LjEuYmIKaW5kZXggODg2ODI3OWQ2YS4uMGIzNTYxOGI5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJmZmkvbGliZmZpXzMuNy4xLmJiCkBAIC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDQgKzEsNCBAQAorIyAt
bGliZmZpIC0gQ29weXJpZ2h0IChjKSAxOTk2LTIwMjUgIEFudGhvbnkgR3JlZW4sIFJlZCBIYXQs
IEluYyBhbmQgb3RoZXJzLgorIyArbGliZmZpIC0gQ29weXJpZ2h0IChjKSAxOTk2LTIwMjYgIEFu
dGhvbnkgR3JlZW4sIFJlZCBIYXQsIEluYyBhbmQgb3RoZXJzLgorIyAgU2VlIHNvdXJjZSBmaWxl
cyBmb3IgZGV0YWlscy4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nCisjIAorIworCiBTVU1NQVJZID0g
IkEgcG9ydGFibGUgZm9yZWlnbiBmdW5jdGlvbiBpbnRlcmZhY2UgbGlicmFyeSIKIEhPTUVQQUdF
ID0gImh0dHA6Ly9zb3VyY2V3YXJlLm9yZy9saWJmZmkvIgogREVTQ1JJUFRJT04gPSAiVGhlIGBs
aWJmZmknIGxpYnJhcnkgcHJvdmlkZXMgYSBwb3J0YWJsZSwgaGlnaCBsZXZlbCBwcm9ncmFtbWlu
ZyBpbnRlcmZhY2UgdG8gdmFyaW91cyBjYWxsaW5nIFwKQEAgLTgsMTIgKzI3LDEyIEBAIGxpYnJh
cnkgcmVhbGx5IG9ubHkgcHJvdmlkZXMgdGhlIGxvd2VzdCwgbWFjaGluZSBkZXBlbmRlbnQgbGF5
ZXIgb2YgYSBmdWxseSBmZWF0CiBBIGxheWVyIG11c3QgZXhpc3QgYWJvdmUgYGxpYmZmaScgdGhh
dCBoYW5kbGVzIHR5cGUgY29udmVyc2lvbnMgZm9yIHZhbHVlcyBwYXNzZWQgYmV0d2VlbiB0aGUg
dHdvIGxhbmd1YWdlcy4iCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9Y2U0NzYzNjcwYzViNzc1NjAwMDU2MWY5YWYxYWIxNzgiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTlhOGRmNTU2ODQ2YmIzZDFlZGVj
MGQ5NjhhMjMxMSIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9LyR7QlBOfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vbm90LXdpbjMyLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMxZmYxZmUzMmRlYWVi
ZmJiMzg4NzI3ZjMyNjc3YmIyNTRiZjJhNDEzODJjNTE0NjRjMGIxODM3YzllZTk4MjgiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDVlOWE2NjM4ZGRiZDI1MTNkZGI1NDUxOGViNjdlNGJiZTZmYTcw
N2JjYzAxYzEwZjYyMTJmMGEwODhkODE5ZCIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1i
dWlsZGRpciIKIEVYVFJBX09FQ09ORjpjbGFzcy1uYXRpdmUgKz0gIi0td2l0aC1nY2MtYXJjaD1n
ZW5lcmljIgotLSAKMi40Ny4xCgo=

--===============6021272895528234566==--

