Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D23CA1010
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89799.1756850190011907235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FQuROpYO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cA9Qe5sC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e7411-65c361eb-f99a-4301-ae8c-f9988dfe6be9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y3/IIIrSsbVnsacQ+dU3C+2OTPe5GvASUMiET64EeTo=;
	b=FQuROpYOKGPQNekowPeEu1inNJVstwRwNWchIrS14iq3SWGRKoSpiWpfk/IPeboA
	NK+V+Rt0nh1CE31oJX1vwNkl8VY9gyk+5BLGiVxnKrZRjzhQUpLlVFchsKQEIXOdJqN
	JR0wFZB+KG1NQDc4i+2fVnmv89bq/fbI6OhcQX5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y3/IIIrSsbVnsacQ+dU3C+2OTPe5GvASUMiET64EeTo=;
	b=cA9Qe5sCdydlSnFsD3vCsv9PExLUOoOodQVPcaf0rW9edOGVzNb9Hxb9/ta/LCRb
	vwN+o5nCUNkEETdajeGj0rPKRe/jKym3kJL7OPw/GtTA4VYsfqc7xZ5PMDaauJKRCXU
	UvEJ2hBjrpclwAg6PLzXiBHnvuo1BddmFKsDimz0=
Content-Type: multipart/mixed; boundary="===============1847288364365039816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.3.0 SUCCEEDED
Message-ID: <010101990c6e7411-65c361eb-f99a-4301-ae8c-f9988dfe6be9-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222777

--===============1847288364365039816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.2.2-1.3.0.patch
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
From b0966e0c1174fba2c951149e8fcff1ab34d4581e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 17:50:46 +0000
Subject: [PATCH] python3-build: upgrade 1.2.2 -> 1.3.0

---
 .../python/{python3-build_1.2.2.bb => python3-build_1.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.2.2.bb => python3-build_1.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.2.2.bb b/meta/recipes-devtools/python/python3-build_1.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.2.2.bb
rename to meta/recipes-devtools/python/python3-build_1.3.0.bb
index 8d4ae2ca1d..2bf08ca08b 100644
--- a/meta/recipes-devtools/python/python3-build_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-build_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c"
+SRC_URI[sha256sum] = "698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============1847288364365039816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.2.2-1.3.0.patch"

RnJvbSBiMDk2NmUwYzExNzRmYmEyYzk1MTE0OWU4ZmNmZjFhYjM0ZDQ1ODFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNzo1MDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYnVpbGQ6IHVwZ3JhZGUgMS4yLjIgLT4gMS4zLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1idWlsZF8xLjIuMi5iYiA9PiBweXRob24zLWJ1aWxkXzEuMy4wLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjIuMi5iYiA9PiBweXRo
b24zLWJ1aWxkXzEuMy4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1idWlsZF8xLjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4yLjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8x
LjMuMC5iYgppbmRleCA4ZDRhZTJjYTFkLi4yYmYwOGNhMDhiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4yLjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMy4wLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9idWlsZCIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzEwNDM5YWYy
ODdiMGZiNDc4MGIyYWQ2OTA3YzI1NmMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTliMmZi
NDYyYWRlZjk4NjQ4MzQzODM3N2ExM2IyZjQyMDY0YTJhM2E0MTYxZjI0YTBjY2E2OThhMDdhYzhj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY5OGVkZDBlYTI3MGJkZTk1MGY1M2FlZDIxZjNhMDEz
NTY3MjIwNmYzOTExZTAxNzYyNjFhMzFlMGUwN2IzOTciCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============1847288364365039816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.2.2.tar.gz;downloadfilename=build-1.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.3.0.tar.gz;downloadfilename=build-1.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.2.2" to "1.3.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 133130 to 136213 (+2%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.2.2" to "1.3.0"
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.13/site-packages/build-1.2.2.dist-info moved to /usr/lib/python3.13/site-packages/build-1.3.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.13/site-packages/build-1.2.2.dist-info moved to /usr/lib/python3.13/site-packages/build-1.3.0.dist-info

--===============1847288364365039816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.13/site-packages/build-1.2.2.dist-info moved to /usr/lib/python3.13/site-packages/build-1.3.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was removed
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.13/site-packages/build-1.2.2.dist-info moved to /usr/lib/python3.13/site-packages/build-1.3.0.dist-info

--===============1847288364365039816==--

