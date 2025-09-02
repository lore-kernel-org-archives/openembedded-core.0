Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48196CA1015
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89795.1756850186776840562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EvDHfFel;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=M22cc5LM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6e9d1e-aa7b6323-ec30-4e4d-92a5-28727d6b7cd1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a1OOm2pRdlM1TTuyXmT7gwepQFmkvdbrBgdKwO+bUh8=;
	b=EvDHfFelwxv+rU+NyOI1NpSLh8cvPi2wWp5gl6Z2AW5IWMyfHM1F+7NiyxrVIomI
	Z+GJ3vFG9v6nlhfG6epBBfniqMJ1n284Rwqebh4fAn3gFSjAdbDIrGcHq2pIcXCnBwW
	aDOlBvCE9669nxZTCBu6P/VpTjGdniqrJr2rk2ys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a1OOm2pRdlM1TTuyXmT7gwepQFmkvdbrBgdKwO+bUh8=;
	b=M22cc5LMy+sEVmS2hENj9nEdD/xFsJDua1SPb+RLyZPzwnkclP+SyiESfxZ6MEVk
	YDkOZi1gryL3wcCtIiA2AS/1ibwQ5zqjqLApCsbYtfwLeHNYG9KDxmHUlH93JD7P3/v
	RcAG4SnnLFoWeL0dqpi/kJFqHqP1M1lxia5y4IQ4=
Content-Type: multipart/mixed; boundary="===============2449984398647821939=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.57.0 FAILED
Message-ID: <010101990c6e9d1e-aa7b6323-ec30-4e4d-92a5-28727d6b7cd1-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222809

--===============2449984398647821939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.57.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.56.4-1.57.0.patch
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
From 0bb289cde38cb0425653f3f0c620dc416a25ca15 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:14:53 +0000
Subject: [PATCH] pango: upgrade 1.56.4 -> 1.57.0

---
 .../recipes-graphics/pango/{pango_1.56.4.bb => pango_1.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.56.4.bb => pango_1.57.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.56.4.bb b/meta/recipes-graphics/pango/pango_1.57.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.56.4.bb
rename to meta/recipes-graphics/pango/pango_1.57.0.bb
index 5de51508fe..5dc8a67dfe 100644
--- a/meta/recipes-graphics/pango/pango_1.56.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.57.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01"
+SRC_URI[archive.sha256sum] = "890640c841dae77d3ae3d8fe8953784b930fa241b17423e6120c7bfdf8b891e7"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.47.1


--===============2449984398647821939==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.56.4-1.57.0.patch"

RnJvbSAwYmIyODljZGUzOGNiMDQyNTY1M2YzZjBjNjIwZGM0MTZhMjVjYTE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDoxNDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvOiB1cGdyYWRlIDEuNTYuNCAtPiAxLjU3LjAKCi0tLQogLi4uL3JlY2lwZXMtZ3JhcGhpY3Mv
cGFuZ28ve3BhbmdvXzEuNTYuNC5iYiA9PiBwYW5nb18xLjU3LjAuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BhbmdvL3twYW5nb18xLjU2LjQuYmIgPT4gcGFuZ29fMS41Ny4wLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU2
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41Ny4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9w
YW5nb18xLjU2LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5n
b18xLjU3LjAuYmIKaW5kZXggNWRlNTE1MDhmZS4uNWRjOGE2N2RmZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTYuNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41Ny4wLmJiCkBAIC0xOCw3ICsxOCw3IEBAIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gInBhbmdvLSg/UDxwdmVyPlxkK1wuKD8hOVxkKylcZCtcLlxkKyki
CiBHSVJfTUVTT05fRU5BQkxFX0ZMQUcgPSAiZW5hYmxlZCIKIEdJUl9NRVNPTl9ESVNBQkxFX0ZM
QUcgPSAiZGlzYWJsZWQiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjE3MDY1ZTJm
Y2M1ZjVhNWJkYmZmYzg4NGM5NTZiZmM3YzQ1MWE5NmU4YzRmYjJmOGFkODM3YzY0MTNjYjVhMDEi
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4OTA2NDBjODQxZGFlNzdkM2FlM2Q4ZmU4
OTUzNzg0YjkzMGZhMjQxYjE3NDIzZTYxMjBjN2JmZGY4Yjg5MWU3IgogCiBERVBFTkRTID0gImds
aWItMi4wIGdsaWItMi4wLW5hdGl2ZSBmb250Y29uZmlnIGZyZWV0eXBlIHZpcnR1YWwvbGliaWNv
bnYgY2Fpcm8gaGFyZmJ1enogZnJpYmlkaSIKIERFUEVORFMgKz0gIiR7QCcgcHl0aG9uMy1kb2N1
dGlscy1uYXRpdmUnIGlmIGQuZ2V0VmFyKCdHSURPQ0dFTl9FTkFCTEVEJykgPT0gJ1RydWUnIGVs
c2UgJyd9IgotLSAKMi40Ny4xCgo=

--===============2449984398647821939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1942 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-79db27d9f3c22002200ec6807a0d0cb59e1a06ae"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:79db27d9f3c22002200ec6807a0d0cb59e1a06ae"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 229 Local 217 Mirrors 0 Missed 12 Current 408 (94% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 464 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb:do_create_spdx_setscene)
NOTE: Running task 949 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa)
NOTE: Running task 957 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1017 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1036 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: Running task 1189 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1193 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_lic)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 637 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1752 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1777 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1778 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_configure)
NOTE: recipe pango-1.57.0-r0: task do_configure: Started
NOTE: recipe pango-1.57.0-r0: task do_configure: Succeeded
NOTE: Running task 1779 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_compile)
NOTE: recipe pango-1.57.0-r0: task do_compile: Started
NOTE: recipe pango-1.57.0-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_install)
NOTE: recipe pango-1.57.0-r0: task do_install: Started
NOTE: recipe pango-1.57.0-r0: task do_install: Succeeded
NOTE: Running task 1781 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_package)
NOTE: Running task 1782 of 1790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.57.0-r0: task do_package: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1782 tasks of which 1768 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902201420.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902201420.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/pango/1.57.0/temp/log.do_package.1175940
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.57.0-r0 do_package: QA Issue: pango: Files/directories were installed but not shipped in any package:
  /etc
  /var
  /etc/fonts
  /etc/fonts/fonts.conf
  /etc/fonts/conf.d
  /etc/fonts/conf.d/51-local.conf
  /etc/fonts/conf.d/49-sansserif.conf
  /etc/fonts/conf.d/70-no-bitmaps-except-emoji.conf
  /etc/fonts/conf.d/60-latin.conf
  /etc/fonts/conf.d/30-metric-aliases.conf
  /etc/fonts/conf.d/README
  /etc/fonts/conf.d/90-synthetic.conf
  /etc/fonts/conf.d/69-unifont.conf
  /etc/fonts/conf.d/48-spacing.conf
  /etc/fonts/conf.d/10-yes-antialias.conf
  /etc/fonts/conf.d/10-hinting-slight.conf
  /etc/fonts/conf.d/40-nonlatin.conf
  /etc/fonts/conf.d/80-delicious.conf
  /etc/fonts/conf.d/65-fonts-persian.conf
  /etc/fonts/conf.d/20-unhint-small-vera.conf
  /etc/fonts/conf.d/10-sub-pixel-none.conf
  /etc/fonts/conf.d/45-generic.conf
  /etc/fonts/conf.d/60-generic.conf
  /etc/fonts/conf.d/50-user.conf
  /etc/fonts/conf.d/45-latin.conf
  /etc/fonts/conf.d/10-scale-bitmap-fonts.conf
  /etc/fonts/conf.d/11-lcdfilter-default.conf
  /etc/fonts/conf.d/65-nonlatin.conf
  /usr/lib/libfontconfig.so.1.16.0
  /usr/lib/libfontconfig.so.1
  /usr/share/fontconfig
  /usr/share/xml
  /usr/share/gettext
  /usr/share/fontconfig/conf.avail
  /usr/share/fontconfig/conf.avail/10-sub-pixel-vbgr.conf
  /usr/share/fontconfig/conf.avail/10-no-antialias.conf
  /usr/share/fontconfig/conf.avail/51-local.conf
  /usr/share/fontconfig/conf.avail/49-sansserif.conf
  /usr/share/fontconfig/conf.avail/10-hinting-full.conf
  /usr/share/fontconfig/conf.avail/70-no-bitmaps-except-emoji.conf
  /usr/share/fontconfig/conf.avail/10-unhinted.conf
  /usr/share/fontconfig/conf.avail/11-lcdfilter-light.conf
  /usr/share/fontconfig/conf.avail/05-reset-dirs-sample.conf
  /usr/share/fontconfig/conf.avail/60-latin.conf
  /usr/share/fontconfig/conf.avail/30-metric-aliases.conf
  /usr/share/fontconfig/conf.avail/10-hinting-medium.conf
  /usr/share/fontconfig/conf.avail/09-autohint-if-no-hinting.conf
  /usr/share/fontconfig/conf.avail/10-hinting-none.conf
  /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf
  /usr/share/fontconfig/conf.avail/35-lang-normalize.conf
  /usr/share/fontconfig/conf.avail/90-synthetic.conf
  /usr/share/fontconfig/conf.avail/69-unifont.conf
  /usr/share/fontconfig/conf.avail/65-khmer.conf
  /usr/share/fontconfig/conf.avail/48-spacing.conf
  /usr/share/fontconfig/conf.avail/70-no-bitmaps-and-emoji.conf
  /usr/share/fontconfig/conf.avail/10-yes-antialias.conf
  /usr/share/fontconfig/conf.avail/10-hinting-slight.conf
  /usr/share/fontconfig/conf.avail/40-nonlatin.conf
  /usr/share/fontconfig/conf.avail/80-delicious.conf
  /usr/share/fontconfig/conf.avail/10-sub-pixel-bgr.conf
  /usr/share/fontconfig/conf.avail/25-unhint-nonlatin.conf
  /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf
  /usr/share/fontconfig/conf.avail/65-fonts-persian.conf
  /usr/share/fontconfig/conf.avail/20-unhint-small-vera.conf
  /usr/share/fontconfig/conf.avail/10-autohint.conf
  /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf
  /usr/share/fontconfig/conf.avail/45-generic.conf
  /usr/share/fontconfig/conf.avail/60-generic.conf
  /usr/share/fontconfig/conf.avail/50-user.conf
  /usr/share/fontconfig/conf.avail/11-lcdfilter-none.conf
  /usr/share/fontconfig/conf.avail/48-guessfamily.conf
  /usr/share/fontconfig/conf.avail/45-latin.conf
  /usr/share/fontconfig/conf.avail/10-sub-pixel-vrgb.conf
  /usr/share/fontconfig/conf.avail/10-scale-bitmap-fonts.conf
  /usr/share/fontconfig/conf.avail/11-lcdfilter-legacy.conf
  /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf
  /usr/share/fontconfig/conf.avail/65-nonlatin.conf
  /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf
  /usr/share/xml/fontconfig
  /usr/share/xml/fontconfig/fonts.dtd
  /usr/share/gettext/its
  /usr/share/gettext/its/fontconfig.its
  /usr/share/gettext/its/fontconfig.loc
  /var/cache
  /var/cache/fontconfig
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
pango: 85 installed and not shipped files. [installed-vs-shipped]
ERROR: pango-1.57.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/pango/1.57.0/temp/log.do_package.1175940
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.57.0.bb:do_package) failed with exit code '1'

--===============2449984398647821939==--

