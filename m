Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B6AE07872C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:19:00 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r78so1575306wme.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 06:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rq/1l2SJUZGbwmpAqjUd2nis43z9YSQshWC5wo7x40Y=;
	b=YNCBZrD4HzHkZpCJsWOmvtp3ihZF6m5lF8NZrEYTJFXJ/Z8c86XLULicHV6e30J0Pf
	y4iJ5OEazKvVDtIW6v/66eFwARdFuu/z1+wgUBLzL0hOkZZCbbjBVqWG4cmpIwnj2+NA
	S9xGs29k5p35KbTOfgk5ge6bTMhI9e8Hur+RtBiqwqpb7ptKA4XlFJicqGvkb1HFCziM
	fblrmRmhEPJqaDUVO/kifISjkE9u8EZaklB9tx6fjG8JO4fK/V0icFgX9QX6lbMXAGhl
	Ra/RcE0V4qB2vGVhjZF9Ae4WahPj4iVS4DzQ7nbJuu8x5bGbKa3BSLKrwcQj4H4qzsG9
	gAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rq/1l2SJUZGbwmpAqjUd2nis43z9YSQshWC5wo7x40Y=;
	b=WeIp1fNzJ8QTxzdE577IVK/ynF0u66Yz2q1NNff8XmdwimXvJYcTPcLI5gqJW/7ll3
	R4AvhjGNssL2u09Mc1Qz8oQPuCPO0lB/BxdZT0r+LN2dqO4eA3Rd2tREJU6pfiq+SeMg
	OveD1cOp/1VDR1XmVP4e7R7G1gMFiq5dh6k/qx4CrerKLeYoCe0XYFYoieHFm9W36Zpm
	85AVoVIn9t+ULPdo3mZmfpMSTYkSN9LmxXXv4njAjYhT85lpzP6czQf1At7dng51EOiD
	drrYLvywmzRRxO0S/4+jH1VIcmc4K1pqVXs4z5chXQGgKjJtqYQ0/R0hy2DzrwMKKjZ6
	qqGQ==
X-Gm-Message-State: AKGB3mJCykLlgNx6/WN87kHKb8ayNRGfLRT2dTNNEEepZnsUFB1KEX0c
	CtnE4zij5Bvdp1eXoyzKcZbrQvAW
X-Google-Smtp-Source: AGs4zMb4UcJKr2KPcjKrjvLDJFTFP7Jemkv7eFMnBak/VbQjcacsDySjiKRo9+9s+byEtQVRk2VTKg==
X-Received: by 10.28.148.195 with SMTP id w186mr4470920wmd.33.1512483541230;
	Tue, 05 Dec 2017 06:19:01 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 34sm301178wra.39.2017.12.05.06.18.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 06:18:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:18:48 +0000
Message-Id: <20171205141848.24825-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171205141848.24825-1-ross.burton@intel.com>
References: <20171205141848.24825-1-ross.burton@intel.com>
Subject: [PATCH 4/4] gstreamer1.0-plugins-bad: remove redundant Wayland patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 14:19:01 -0000

The installation path and wayland-scanner location problems in Wayland were
resolved in "wayland: Fix installation patch issue" (oe-core 14c0d99) which made
the WAYLAND_PROTOCOLS_SYSROOT_DIR workaround redundant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 38 ----------------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb   |  1 -
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
deleted file mode 100644
index 48d93ab284b..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7c8f68c5428380b930579dc9ef27c853264448fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 May 2017 15:06:11 +0300
-Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
-
-In cross environment we have to prepend the sysroot to the path found by
-pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
-it ends up using the files from host system. If build host has wayland installed
-the build will succeed but if you dont have wayland-protocols installed on build
-host then it wont find the files on build host
-
-This should work ok with non sysrooted builds too since
-in those cases PKG_CONFIG_SYSROOT_DIR will be empty
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e307be6..83cdeb0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2272,7 +2272,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
-   PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.4.0 libdrm >= 2.4.55 wayland-protocols >= 1.4, [
-     if test "x$wayland_scanner" != "x"; then
-       HAVE_WAYLAND="yes"
--      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-+      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-     else
-       AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
-       HAVE_WAYLAND="no"
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
index cbba01cbfb3..0380580335c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
@@ -12,7 +12,6 @@ SRC_URI = " \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
     file://link-with-libvchostif.patch \
     file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
     file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
-- 
2.11.0


