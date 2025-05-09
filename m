Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FEEC3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6638.1746763006863257148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jh7Vi7AQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763006; x=1778299006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E+2odYXTn+GT933jfe8nEXBfCyW0K07vRiry4OjXQL4=;
  b=jh7Vi7AQC7nNnxhYEoLfvaJyFRftInR5VSUZTWaP8r7LE2TDgKxlfYfj
   7LEneP/W7gSPult3NFDI3IeLPXCXjyrU86SToQS5Waodz1M/3Ofs/dLtI
   qRYPrsRaGzNlOzx1UMHyP9Rqxz9l5sgs9kvu3YeZCumgYdKa6F7Ef/JaT
   2aW0hHd7N3kB099O/PanIH0jA/aSi4dL2L0qeQiViSglcrP+QseKjnEm+
   z4Tozl4jpgHnGlxo4hqq1Cg/bbbGLAdfpKeISFJhu8MsO9xprLCRIydo4
   nN4qbCdSn2kIu/iXJUEqoP9XRVobDDxcSFTv8j6kbDT/tti5ZUaxBiSXt
   w==;
X-CSE-ConnectionGUID: kITTycqESzW+vPN9wd7Egw==
X-CSE-MsgGUID: NX4tmuKVSi2XDYPmqNRzuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="201766837"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="201766837"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:43 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EAEFD6EAF
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC499CFF8D
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 78EE01A009A;
	Fri,  9 May 2025 11:56:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/19] gstreamer1.0-plugins-base: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:06 +0800
Message-Id: <1746762980-12783-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216169

From: Wang Mingyu <wangmy@fujitsu.com>

0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
removed since it's included in 1.26.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gins-base-Fix-atomic-64-issue-on-arm.patch | 52 -------------------
 ...bb => gstreamer1.0-plugins-base_1.26.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.0.bb => gstreamer1.0-plugins-base_1.26.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
deleted file mode 100644
index 437409854f..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 677a40c1f5b0793598a92cbba0a621fef89c4a26 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Wed, 2 Apr 2025 09:37:24 +0000
-Subject: [PATCH] gstreamer1.0-plugins-base: Fix atomic 64 issue on armv5
-
-| /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld: gst-libs/gst/audio/libgstaudio-1.0.so.0.2600.0.p/gstaudioringbuffer.c.o: in function `gst_atomic_uint64_get':
-| /usr/src/debug/gstreamer1.0-plugins-base/1.26.0/gst-libs/gst/audio/gstaudioringbuffer.c:72:(.text+0x4e00): undefined reference to `__atomic_load_8'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- gst-libs/gst/audio/meson.build | 2 +-
- meson.build                    | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/audio/meson.build b/gst-libs/gst/audio/meson.build
-index 1d69713..cf8935b 100644
---- a/gst-libs/gst/audio/meson.build
-+++ b/gst-libs/gst/audio/meson.build
-@@ -162,7 +162,7 @@ gstaudio = library('gstaudio-@0@'.format(api_version),
-   soversion : soversion,
-   darwin_versions : osxversion,
-   install : true,
--  dependencies : gstaudio_deps,
-+  dependencies : [ gstaudio_deps, base_platform_dep ],
- )
- pkg_name = 'gstreamer-audio-1.0'
- pkgconfig.generate(gstaudio,
-diff --git a/meson.build b/meson.build
-index a470af0..c195376 100644
---- a/meson.build
-+++ b/meson.build
-@@ -398,6 +398,15 @@ else
-   core_conf.set('DISABLE_ORC', 1)
- endif
- 
-+base_platform_dep = []
-+# Check for libatomic for use of C11 atomics: some architectures need
-+# to link explicitly to this library.
-+# TODO: Once meson 1.7 is in use, this can be updated to
-+# dependency('atomic')
-+atomic_dep = cc.find_library('atomic', required: false)
-+
-+base_platform_dep += [atomic_dep]
-+
- # Used to build SSE* things in audio-resampler
- sse_args = '-msse'
- sse2_args = '-msse2'
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
index afb02f6042..c872c3bcfb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
@@ -10,9 +10,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch \
            "
-SRC_URI[sha256sum] = "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
+SRC_URI[sha256sum] = "659553636f84dcf388cad5cf6530e02b0b2d3dc450e76199287ba9db6a6c5226"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


