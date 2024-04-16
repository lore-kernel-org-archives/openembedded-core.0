Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE21C3271A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13424.1713248037244273313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Afj99NY8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KmEMuTcL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a94a8-d5c3da83-16fe-4283-9178-4ddf3efc08d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LQ6OQzo2fRPFrhFuloVC7IsSxJq5brdbM5PRt8eoL1w=;
	b=Afj99NY81jmBawK84wjYRGd7crov9h0CedygvOzypfbSldsXmTgoJv9az2xWSE1z
	bsxA1nf5yi8Y8cEqC3LuyW3iFI22aOH6BANHijgDJtSuqA6/fpCi5I1EGMdfXC0QR0+
	MuFvGxAPKjSJc8FC8qUPJAYcZbOdpG3F8aJ6U9+4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LQ6OQzo2fRPFrhFuloVC7IsSxJq5brdbM5PRt8eoL1w=;
	b=KmEMuTcLvtgdT2GuTZSlaC7xvVcCtO8FLQu+Q2zZ9O5+kqGg9qT/Zl+Ryx8CcBYp
	M02xEtT/0fz49AAPLPp+kA72b9HVIPWS49neQDh5X4sXjcNQGv2Asflt+gh+8c6zD8c
	NY7TKE8jmTUTS0Bivm1svE2ohSAvkR5YO690QRiE=
Content-Type: multipart/mixed; boundary="===============1332489290478327080=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.18 SUCCEEDED
Message-ID: <0101018ee58a94a8-d5c3da83-16fe-4283-9178-4ddf3efc08d0-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198350

--===============1332489290478327080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxmlb* to *0.3.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.15-0.3.18.patch
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
From c22485356f3e86c0ba8350fbcc328c2350d1db0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:33:23 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.15 -> 0.3.18

---
 .../0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch      | 9 +++------
 .../libxmlb/{libxmlb_0.3.15.bb => libxmlb_0.3.18.bb}     | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.15.bb => libxmlb_0.3.18.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index da8ce68df9..743336afec 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
+From 213625c03a8c5b86e7c2cca9fbc13242515d13a0 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 47d9728..8b3dd0e 100644
+index 1daca18..2e5b251 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2870,7 +2870,7 @@ xb_speed_func(void)
+@@ -2876,7 +2876,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
@@ -30,6 +30,3 @@ index 47d9728..8b3dd0e 100644
  
  	g_test_init(&argc, &argv, NULL);
  
--- 
-2.41.0
-
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
index 528e3e0bab..10ceab0721 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "25a6384ad60f7e8550292e6cb4f262cc5da74be4"
+SRCREV = "59cf2e0bf3c4d0905a32e32828d6100784993621"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.42.0


--===============1332489290478327080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: FILELIST: removed "/usr/libexec/installed-tests/libxmlb/test.xml.zstd", added "/usr/libexec/installed-tests/libxmlb/test.xml.zst"

--===============1332489290478327080==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.15-0.3.18.patch"

RnJvbSBjMjI0ODUzNTZmM2U4NmMwYmE4MzUwZmJjYzMyOGMyMzUwZDFkYjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6MzM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4xNSAtPiAwLjMuMTgKCi0tLQogLi4uLzAwMDEteGItc2VsZnRl
c3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoICAgICAgfCA5ICsrKy0tLS0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjE1LmJiID0+IGxpYnhtbGJfMC4zLjE4LmJifSAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMTUuYmIgPT4gbGli
eG1sYl8wLjMuMTguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xp
YnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVz
dC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggZGE4Y2U2OGRmOS4uNzQzMzM2
YWZlYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAx
LXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1H
X1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYzIwOGJhZmM1N2MxY2Nh
YTBjYTI2MGY5OWM4YjRjOTc2MjcxZWJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
MTM2MjVjMDNhOGM1Yjg2ZTdjMmNjYTlmYmMxMzI0MjUxNWQxM2EwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogU2F0
LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxmLXRl
c3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1zZWxm
LXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggNDdkOTcyOC4uOGIzZGQwZSAxMDA2
NDQKK2luZGV4IDFkYWNhMTguLjJlNWIyNTEgMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10ZXN0
LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI4NzAsNyArMjg3MCw3IEBAIHhiX3Nw
ZWVkX2Z1bmModm9pZCkKK0BAIC0yODc2LDcgKzI4NzYsNyBAQCB4Yl9zcGVlZF9mdW5jKHZvaWQp
CiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpAQCAtMzAsNiArMzAsMyBA
QCBpbmRleCA0N2Q5NzI4Li44YjNkZDBlIDEwMDY0NAogIAogIAlnX3Rlc3RfaW5pdCgmYXJnYywg
JmFyZ3YsIE5VTEwpOwogIAotLS0gCi0yLjQxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTUuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
eG1sYi9saWJ4bWxiXzAuMy4xOC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4xNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTguYmIKaW5kZXggNTI4ZTNlMGJh
Yi4uMTBjZWFiMDcyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGli
eG1sYl8wLjMuMTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8w
LjMuMTguYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMS14Yi1z
ZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZpbGU6Ly9ydW4tcHRl
c3QgXAogIgotU1JDUkVWID0gIjI1YTYzODRhZDYwZjdlODU1MDI5MmU2Y2I0ZjI2MmNjNWRhNzRi
ZTQiCitTUkNSRVYgPSAiNTljZjJlMGJmM2M0ZDA5MDVhMzJlMzI4MjhkNjEwMDc4NDk5MzYyMSIK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAgeHogenN0ZCIKLS0g
CjIuNDIuMAoK

--===============1332489290478327080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxmlb: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1747752 to 1747776 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 352350 to 352371 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: FILELIST: removed "/usr/libexec/installed-tests/libxmlb/test.xml.zstd", added "/usr/libexec/installed-tests/libxmlb/test.xml.zst"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 508934 to 509106 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.15 [default] to 0.3.18 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb: PV changed from "0.3.15" to "0.3.18"
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.15 [default] to 0.3.18 [default]

--===============1332489290478327080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 61 recipes from the core2-64 sysroot...done.
Removing 73 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9af1a4c1d9fcd30fdb099136b66022de2be78c4c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9af1a4c1d9fcd30fdb099136b66022de2be78c4c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 341 Local 326 Mirrors 0 Missed 15 Current 240 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 249 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 250 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 263 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 264 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 265 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 266 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 268 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 269 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 270 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 403 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_write_config)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: Running task 418 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_fetch: Succeeded
NOTE: Running task 435 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_unpack)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 405 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/psmisc/23.6/temp/log.do_packagedata_setscene.443665
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 406 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_unpack: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 447 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 435 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 437 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 443 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 472 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 491 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1012 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1026 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1041 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 494 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_patch: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1118 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_lic: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_populate_lic unihash changed to c757081b2e014eedf4a67529092c1d467abfa93e58e87fd0d0694d8a0c3c9faa
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1126 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_deploy_source_date_epoch unihash changed to 6988cb974b17964eee7367749a7d2a55219955bb37efaf21f5557bf4dcb7825b
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1132 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1158 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1185 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 656e3b165ae36692f394b186520239ad94be584b58328c7cecceceeb11948aec to hashserv.yocto.io:8686 ({'taskhash': 'bc4518c61e44597dabace76f1678a7164bb88f59603a4e71a97a0f1f95d37249', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '656e3b165ae36692f394b186520239ad94be584b58328c7cecceceeb11948aec'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed bc4518c61e44597dabace76f1678a7164bb88f59603a4e71a97a0f1f95d37249 -> 656e3b165ae36692f394b186520239ad94be584b58328c7cecceceeb11948aec as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1476 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1586 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata)
NOTE: Running task 1607 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1624 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_configure)
NOTE: recipe libxmlb-0.3.18-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_configure: Succeeded
NOTE: Running task 1625 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1626 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_compile)
NOTE: recipe libxmlb-0.3.18-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1628 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_install)
NOTE: recipe libxmlb-0.3.18-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1630 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package)
NOTE: Running task 1631 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_populate_sysroot unihash changed to 09c997dd02d048cddbc66aa0662f3315cf2438e6e50e2e7447007b0c1ec9e3dc
NOTE: recipe libxmlb-0.3.18-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package unihash changed to 2b4d4bbc0b563fddd7b6c1bb9d60bae344ef3584679967b7f6c1fc4b5f34936d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_qa became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_ipk became valid
NOTE: Running setscene task 577 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_qa_setscene)
NOTE: Running setscene task 578 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 579 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 580 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package_write_rpm_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_package_qa_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 581 of 581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1633 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.18-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 1638 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_create_runtime_spdx)
NOTE: recipe libxmlb-0.3.18-r0: task do_create_runtime_spdx: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1639 of 1639 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_build)
NOTE: Tasks Summary: Attempted 1639 tasks of which 1610 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.7-r0 to 0:23.6-r0) [version-going-backwards]
ERROR: psmisc-23.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1332489290478327080==--

