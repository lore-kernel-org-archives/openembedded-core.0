Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95250CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 05:40:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.684.1782279613079964327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 22:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZSddr7oe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QoMIaRtw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ef824a611-35390dee-4d01-4fe6-9b1c-20e85f4b0cc8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782279612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XWwxg7mJy3UDvasvVQolV75YxHIqvXlZR3x+NLqW9iI=;
	b=ZSddr7oefGZv7+KnKIOnPDqfoLL8ObyNIKN909Osfe3+4RujLj0/hiRA8Dxybd49
	898vo3xScAl/Fjo023nz1n6VyWiB023lbH5nyrnoEEIrXOmW4jZMGVVrLy5y5W00QVt
	NRTdmetOtX45gT1sDbZgjoq678sElIs5x22lQv7U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782279612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XWwxg7mJy3UDvasvVQolV75YxHIqvXlZR3x+NLqW9iI=;
	b=QoMIaRtwefeNvsppFF3KSnQKE7IwrYxNNzk4lrkgHYbA7oLeQuCGWj6OKc3I48Yu
	SPfbGfAmWyU3rnvXVRIjnEsQu/NxAgnLjgRsxDn/QL3AL214ORtjnZfnE6lgZKQKhuO
	Q9SY+k5yQ9au9YcTfgGeRJRE/GRAZYzfqPwzm2/A=
Content-Type: multipart/mixed; boundary="===============7703318625245965611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.9.90 SUCCEEDED
Message-ID: <0101019ef824a611-35390dee-4d01-4fe6-9b1c-20e85f4b0cc8-000000@us-west-2.amazonses.com>
Date: Wed, 24 Jun 2026 05:40:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 05:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239467

--===============7703318625245965611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.9.90* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.5.1-2.9.90.patch
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
From 31bc9e6a9ce94df80c4d921d641997a2c9b6042a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 24 Jun 2026 05:22:05 +0000
Subject: [PATCH] pkgconf: upgrade 2.5.1 -> 2.9.90

---
 .../{pkgconf_2.5.1.bb => pkgconf_2.9.90.bb}   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.5.1.bb => pkgconf_2.9.90.bb} (79%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.9.90.bb
similarity index 79%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.9.90.bb
index 277ef9786c..a05dceeae0 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.9.90.bb
@@ -1,3 +1,23 @@
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
+# @@ -1,5 +1,4 @@
+# -Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018
+# -    pkgconf authors (see AUTHORS file in source directory).
+# +Copyright (c) 2011-2026 pkgconf authors (see AUTHORS file in source directory).
+#  
+#  Permission to use, copy, modify, and/or distribute this software for any
+#  purpose with or without fee is hereby granted, provided that the above
+# 
+#
+
 SUMMARY = "pkgconf provides compiler and linker configuration for development frameworks."
 DESCRIPTION = "pkgconf is a program which helps to configure compiler and linker \
 flags for development frameworks. It is similar to pkg-config from \
@@ -12,7 +32,7 @@ RPROVIDES:${PN} += "pkgconfig"
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
 LICENSE = "pkgconf"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2214222ec1a820bd6cc75167a56925e0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e33c297f35e165ecf4fbc81974dc9ca"
 
 SRC_URI = "\
     https://distfiles.ariadne.space/pkgconf/pkgconf-${PV}.tar.xz \
@@ -20,7 +40,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582cfffd658b0a50c243"
+SRC_URI[sha256sum] = "24fd9d086d06a4abbbc74117ae4737c93c2d890afe7e9816558b6276a71357ec"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============7703318625245965611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 657384 (+62%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 40806 (+50%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/doc/pkgconf/COPYING /usr/share/doc/pkgconf/DCO /usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/man/man1/spdxtool.1"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 63357 (+43%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 492706 (+64%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7.0.0 /usr/lib/libpkgconf.so.7", added "/usr/lib/libpkgconf.so.8 /usr/bin/spdxtool /usr/lib/libpkgconf.so.8.0.0"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 258933 (+48%)
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8

--===============7703318625245965611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.5.1-2.9.90.patch"

RnJvbSAzMWJjOWU2YTljZTk0ZGY4MGM0ZDkyMWQ2NDE5OTdhMmM5YjYwNDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjQgSnVuIDIwMjYgMDU6MjI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuNS4xIC0+IDIuOS45MAoKLS0tCiAuLi4ve3BrZ2NvbmZfMi41LjEu
YmIgPT4gcGtnY29uZl8yLjkuOTAuYmJ9ICAgfCAyNCArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi97cGtnY29uZl8yLjUuMS5iYiA9PiBwa2djb25mXzIu
OS45MC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29u
Zi9wa2djb25mXzIuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8yLjkuOTAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjkuOTAuYmIKaW5kZXggMjc3ZWY5Nzg2Yy4uYTA1
ZGNlZWFlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8yLjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIu
OS45MC5iYgpAQCAtMSwzICsxLDIzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORwor
IyArKysgQ09QWUlORworIyBAQCAtMSw1ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxMSwg
MjAxMiwgMjAxMywgMjAxNCwgMjAxNSwgMjAxNiwgMjAxNywgMjAxOAorIyAtICAgIHBrZ2NvbmYg
YXV0aG9ycyAoc2VlIEFVVEhPUlMgZmlsZSBpbiBzb3VyY2UgZGlyZWN0b3J5KS4KKyMgK0NvcHly
aWdodCAoYykgMjAxMS0yMDI2IHBrZ2NvbmYgYXV0aG9ycyAoc2VlIEFVVEhPUlMgZmlsZSBpbiBz
b3VyY2UgZGlyZWN0b3J5KS4KKyMgIAorIyAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlm
eSwgYW5kL29yIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3IgYW55CisjICBwdXJwb3NlIHdp
dGggb3Igd2l0aG91dCBmZWUgaXMgaGVyZWJ5IGdyYW50ZWQsIHByb3ZpZGVkIHRoYXQgdGhlIGFi
b3ZlCisjIAorIworCiBTVU1NQVJZID0gInBrZ2NvbmYgcHJvdmlkZXMgY29tcGlsZXIgYW5kIGxp
bmtlciBjb25maWd1cmF0aW9uIGZvciBkZXZlbG9wbWVudCBmcmFtZXdvcmtzLiIKIERFU0NSSVBU
SU9OID0gInBrZ2NvbmYgaXMgYSBwcm9ncmFtIHdoaWNoIGhlbHBzIHRvIGNvbmZpZ3VyZSBjb21w
aWxlciBhbmQgbGlua2VyIFwKIGZsYWdzIGZvciBkZXZlbG9wbWVudCBmcmFtZXdvcmtzLiBJdCBp
cyBzaW1pbGFyIHRvIHBrZy1jb25maWcgZnJvbSBcCkBAIC0xMiw3ICszMiw3IEBAIFJQUk9WSURF
Uzoke1BOfSArPSAicGtnY29uZmlnIgogIyBUaGUgcGtnY29uZiBsaWNlbnNlIHNlZW1zIHRvIGJl
IGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIEJTRC0yLUNsYXVzZSBvcgogIyBJU0MsIGJ1dCBo
YXMgZGlmZmVyZW50IHdvcmRpbmcsIHNvIG5lZWRzIGl0cyBvd24gbmFtZS4KIExJQ0VOU0UgPSAi
cGtnY29uZiIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTIyMTQyMjJl
YzFhODIwYmQ2Y2M3NTE2N2E1NjkyNWUwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9MWUzM2MyOTdmMzVlMTY1ZWNmNGZiYzgxOTc0ZGM5Y2EiCiAKIFNSQ19VUkkgPSAi
XAogICAgIGh0dHBzOi8vZGlzdGZpbGVzLmFyaWFkbmUuc3BhY2UvcGtnY29uZi9wa2djb25mLSR7
UFZ9LnRhci54eiBcCkBAIC0yMCw3ICs0MCw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly9w
a2ctY29uZmlnLW5hdGl2ZS5pbiBcCiAgICAgZmlsZTovL3BrZy1jb25maWctZXNkay5pbiBcCiAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2QwNWM5NTg5YjlmODZlY2YwNDRjMTBhMjI2OTgyMmJj
OWViMDAxZWNlZDI1ODJjZmZmZDY1OGIwYTUwYzI0MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIy
NGZkOWQwODZkMDZhNGFiYmJjNzQxMTdhZTQ3MzdjOTNjMmQ4OTBhZmU3ZTk4MTY1NThiNjI3NmE3
MTM1N2VjIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============7703318625245965611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.9.90.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 657384 (+62%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.7.0.0", added "/usr/bin/.debug/spdxtool /usr/lib/.debug/libpkgconf.so.8.0.0"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 40806 (+50%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 63357 (+43%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/DCO /usr/share/doc/pkgconf/COPYING"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 492706 (+64%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/2.5.1/cli/bomtool -> /usr/src/debug/pkgconf/2.9.90/cli/bomtool, removed "/usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/cache.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/client.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.5.1/cli/main.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/audit.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/
 parser.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/iter.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/path.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/queue.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/personality.c", added "/usr/src/debug/pkgconf/2.9.90/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/serialize.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/serialize.h /usr/src/debug/pkgconf/2.9.90/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.9.90/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/iter.h /usr/src/debug/pkgconf/2.9.90/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/simplelicensing.h /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/core.h /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/software.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/bufferset.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/util.h /usr/sr
 c/debug/pkgconf/2.9.90/libpkgconf/personality.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/main.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/util.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/core.c /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/software.h /usr/src/debug/pkgconf/2.9.90/cli/spdxtool/simplelicensing.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/client.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/output.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/parser.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.9.90/cli/getopt_long.c /usr/src/debug/pkgconf/2.9.90/cli/getopt_long.h /usr/src/debug/pkgconf/2.9.90/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.9.90/libpkgconf/cache.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/audit.c /usr/src/debug/pkgconf/2.9.90/lib
 pkgconf/argvsplit.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/queue.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/license.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/version.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/bytecode.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/path.h /usr/src/debug/pkgconf/2.9.90/cli/core.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/path.c /usr/src/debug/pkgconf/2.9.90/cli/core.h /usr/src/debug/pkgconf/2.9.90/cli/main.c /usr/src/debug/pkgconf/2.9.90/libpkgconf/variable.c"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.5.1" to "2.9.90"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 258933 (+48%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0", added "/usr/lib/libpkgconf.so.8.0.0 /usr/bin/spdxtool /usr/lib/libpkgconf.so.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.90 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "2.5.1" to "2.9.90"
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8

--===============7703318625245965611==--

