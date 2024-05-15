Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36109C3DA6F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1291.1715794339189351963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P0GanUYn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ehdL74WR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe351-385a4c70-36a7-404f-8324-7df9459dbe74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hkbLSrZcjXyARSnJC8l3tmkBMdw6vSudpTTaCegEG4A=;
	b=P0GanUYn3xGQAx9uxUGMkeV+bG8cwXOQFZyClUfQT+lW+NatY5Is+0Iq1ouarTC+
	xGIh+HBk8sOwfDa2CMY62lZGls8ecwhMX5X/XqgXU2E3p09uvLj8SxZ7CwMldlH4yqQ
	cmMZzDxQTqIqKgIyXV0M/aYh+dYR4+9bShOvzFGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hkbLSrZcjXyARSnJC8l3tmkBMdw6vSudpTTaCegEG4A=;
	b=ehdL74WRdHwGTgkCH15qHbCbewuYbOpjlxuic0HyIdtxbldb0qS7wzO2qQkFLbrM
	HFW4YFxlQH2uk9SMRHkI8dNDR1UySN0DIUFitszvdXQTAT4lZpApQS60lJO7QoQFQpC
	U9jfs1bEBkWtxKREVm7BOBNUiEhxTgjkcNo5QQho=
Content-Type: multipart/mixed; boundary="===============7922475990701244197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.21.0 FAILED
Message-ID: <0101018f7d4fe351-385a4c70-36a7-404f-8324-7df9459dbe74-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199374

--===============7922475990701244197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.21.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1882 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.20.0-2.21.0.patch
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
From 0b91c4a8db4c0833c685e22ee416970138905d36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 13:23:50 +0000
Subject: [PATCH] libva-initial: upgrade 2.20.0 -> 2.21.0

---
 .../libva/libva-initial_2.20.0.bb             |  8 ----
 meta/recipes-graphics/libva/libva.inc         | 37 -------------------
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-initial_2.20.0.bb
 delete mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
deleted file mode 100644
index 453096822f..0000000000
--- a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libva.inc
-
-PACKAGECONFIG ?= ""
-
-do_install:append () {
-	rm -f ${D}${libdir}/*.so*
-}
-
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
deleted file mode 100644
index 486291bced..0000000000
--- a/meta/recipes-graphics/libva/libva.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Video Acceleration (VA) API for Linux"
-DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
-and API specification which enables and provides access to graphics \
-hardware (GPU) acceleration for video processing on Linux and UNIX \
-based operating systems. Accelerated processing includes video \
-decoding, video encoding, subpicture blending and rendering. The \
-specification was originally designed by Intel for its GMA (Graphics \
-Media Accelerator) series of GPU hardware, the API is however not \
-limited to GPUs or Intel specific hardware, as other hardware and \
-manufacturers can also freely use this API for hardware accelerated \
-video decoding."
-
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
-
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
-
-S = "${WORKDIR}/libva-${PV}"
-
-GITHUB_BASE_URI = "https://github.com/intel/libva/releases"
-
-DEPENDS = "libdrm"
-
-inherit meson pkgconfig github-releases
-
-PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
-
-PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
-
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.44.0


--===============7922475990701244197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.20.0-2.21.0.patch"

RnJvbSAwYjkxYzRhOGRiNGMwODMzYzY4NWUyMmVlNDE2OTcwMTM4OTA1ZDM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTM6MjM6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YS1pbml0aWFsOiB1cGdyYWRlIDIuMjAuMCAtPiAyLjIxLjAKCi0tLQogLi4uL2xpYnZhL2xp
YnZhLWluaXRpYWxfMi4yMC4wLmJiICAgICAgICAgICAgIHwgIDggLS0tLQogbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYyAgICAgICAgIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjIwLjAuYmIKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4yMC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4yMC4wLmJi
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0NTMwOTY4MjJmLi4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS1pbml0aWFsXzIuMjAuMC5iYgor
KysgL2Rldi9udWxsCkBAIC0xLDggKzAsMCBAQAotcmVxdWlyZSBsaWJ2YS5pbmMKLQotUEFDS0FH
RUNPTkZJRyA/PSAiIgotCi1kb19pbnN0YWxsOmFwcGVuZCAoKSB7Ci0Jcm0gLWYgJHtEfSR7bGli
ZGlyfS8qLnNvKgotfQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmEuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYwpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNDg2MjkxYmNlZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCisrKyAvZGV2L251bGwKQEAgLTEsMzcg
KzAsMCBAQAotU1VNTUFSWSA9ICJWaWRlbyBBY2NlbGVyYXRpb24gKFZBKSBBUEkgZm9yIExpbnV4
IgotREVTQ1JJUFRJT04gPSAiVmlkZW8gQWNjZWxlcmF0aW9uIEFQSSAoVkEgQVBJKSBpcyBhIGxp
YnJhcnkgKGxpYlZBKSBcCi1hbmQgQVBJIHNwZWNpZmljYXRpb24gd2hpY2ggZW5hYmxlcyBhbmQg
cHJvdmlkZXMgYWNjZXNzIHRvIGdyYXBoaWNzIFwKLWhhcmR3YXJlIChHUFUpIGFjY2VsZXJhdGlv
biBmb3IgdmlkZW8gcHJvY2Vzc2luZyBvbiBMaW51eCBhbmQgVU5JWCBcCi1iYXNlZCBvcGVyYXRp
bmcgc3lzdGVtcy4gQWNjZWxlcmF0ZWQgcHJvY2Vzc2luZyBpbmNsdWRlcyB2aWRlbyBcCi1kZWNv
ZGluZywgdmlkZW8gZW5jb2RpbmcsIHN1YnBpY3R1cmUgYmxlbmRpbmcgYW5kIHJlbmRlcmluZy4g
VGhlIFwKLXNwZWNpZmljYXRpb24gd2FzIG9yaWdpbmFsbHkgZGVzaWduZWQgYnkgSW50ZWwgZm9y
IGl0cyBHTUEgKEdyYXBoaWNzIFwKLU1lZGlhIEFjY2VsZXJhdG9yKSBzZXJpZXMgb2YgR1BVIGhh
cmR3YXJlLCB0aGUgQVBJIGlzIGhvd2V2ZXIgbm90IFwKLWxpbWl0ZWQgdG8gR1BVcyBvciBJbnRl
bCBzcGVjaWZpYyBoYXJkd2FyZSwgYXMgb3RoZXIgaGFyZHdhcmUgYW5kIFwKLW1hbnVmYWN0dXJl
cnMgY2FuIGFsc28gZnJlZWx5IHVzZSB0aGlzIEFQSSBmb3IgaGFyZHdhcmUgYWNjZWxlcmF0ZWQg
XAotdmlkZW8gZGVjb2RpbmcuIgotCi1IT01FUEFHRSA9ICJodHRwczovLzAxLm9yZy9saW51eG1l
ZGlhL3ZhYXBpIgotQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGlidmEv
aXNzdWVzIgotCi1TRUNUSU9OID0gIngxMSIKLUxJQ0VOU0UgPSAiTUlUIgotCi1TUkNfVVJJID0g
IiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIuYnoyIgot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4
MmU1ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjcyYmRiNGY0OGRmZTcxYWQw
MWYxY2JlZmUwNjk2NzJhMmM5NDlhNmFiZDUxY2YzYzRkNDc4NDIxMGJhZGM0OSIKLQotUyA9ICIk
e1dPUktESVJ9L2xpYnZhLSR7UFZ9IgotCi1HSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2ludGVsL2xpYnZhL3JlbGVhc2VzIgotCi1ERVBFTkRTID0gImxpYmRybSIKLQotaW5o
ZXJpdCBtZXNvbiBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCi0KLVBBQ0tBR0VDT05GSUdbeDEx
XSA9ICItRHdpdGhfeDExPXllcywtRHdpdGhfeDExPW5vLHZpcnR1YWwvbGlieDExIGxpYnhleHQg
bGlieGZpeGVzIgotUEFDS0FHRUNPTkZJR1tnbHhdID0gIi1Ed2l0aF9nbHg9eWVzLC1Ed2l0aF9n
bHg9bm8sdmlydHVhbC9tZXNhIgotCi1QQUNLQUdFQ09ORklHW3dheWxhbmRdID0gIi1Ed2l0aF93
YXlsYW5kPXllcywtRHdpdGhfd2F5bGFuZD1ubyx3YXlsYW5kLW5hdGl2ZSB3YXlsYW5kIgotCi1C
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0KLS0gCjIuNDQuMAoK

--===============7922475990701244197==--

