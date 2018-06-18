Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 470E674854
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:10:49 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id h10-v6so16166704wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=miVwV+mZjFiJ1BXQ/+n9fze9ik31pd6JNawevTXO65Y=;
	b=t6PH7HABQMBhqp+vS5eyLNYmKI6bcVYLwBnEPXAIUPWVphwUx+73lPqQaJpuaNEaqX
	xVwW/2BXJtl2vtoqUY+6bKZ9mSe7EzLyliN4F0b9YQKYquCqOHByYxLN+w1fjr/DrUvn
	nuEvCHxy2YckVsdUwBvF5NbLK2iHTPIoK4a8ieDeWnKB3qJfwK1y8gPjYT3kYj7/a4DR
	7+7yB4aXdEoYhzQsaieVqTz/9xnO8j3oKyadngHGBEezZAHpkKm4et0Gs18ELqsojjXA
	blEHWBe2XxCyzaTyjxhAcdkxfQVvLXJpDERhtes45NLaW7a7x9vV0Nx3hjXI1iHmWbtB
	AK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=miVwV+mZjFiJ1BXQ/+n9fze9ik31pd6JNawevTXO65Y=;
	b=n9Igg+4nV4uhG7tW4vlLCE9XIMoBD2nvXgA3OFM5DV1CqwkbnKmeX950wp9SrQioWa
	TF92IPaMF12njjB1wwNUG9bNKwQUsW/4i3VXNy9c2+GbvGMaW4FUMoI0j/uKgKHuU/pQ
	nXuKvR6+a9RtWK43aHGLtO8ZoqmUFMiD0xcoZiGPKeawLUbGJOSKOpUJUMj8t3S1aET7
	+N/efWnXGpxbeMl2rAxLOeTCIKjNRU7iCqgQyUYL77kHwEiKI/XnpEe1i0zl4lU8tRRz
	aAi12gxldQZ49XwJFd0ocyf6GUxygdAHFBmgRsv7hVonjRbtHuep0MyQvgxwRIVwoY+d
	sHOw==
X-Gm-Message-State: APt69E1s35E2CsS8G3M78Ij5I0V7JNmBI5+4Gv3feJRm2d6r4Dq6pFiB
	D9G7C0REdFbJ5yGzlvd1BVU1GF4I
X-Google-Smtp-Source: ADUXVKLgcxe4OhASSlltX9PVPDZM9UhWt+HLIx9BYPbyicjQ0KhWN3wHGIoc53YhIoQeNzrlo+8MBw==
X-Received: by 2002:adf:e542:: with SMTP id
	z2-v6mr10050547wrm.111.1529316649281; 
	Mon, 18 Jun 2018 03:10:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e2-v6sm17583475wro.97.2018.06.18.03.10.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 03:10:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:10:42 +0100
Message-Id: <20180618101044.10636-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] xf86-video-intel: patch cleanup
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
X-List-Received-Date: Mon, 18 Jun 2018 10:10:49 -0000

always_include_xorg_server.h.patch is merged upstream, so drop it.

disable-x11-dri3.patch was purely to solve determinism issues with the shared sysroot, which
we don't have anymore.

Also remove redundant tarball checksums as this recipe fetches from git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../always_include_xorg_server.h.patch             | 24 ----------------------
 .../xf86-video-intel/disable-x11-dri3.patch        | 17 ---------------
 .../xorg-driver/xf86-video-intel_git.bb            |  4 ----
 3 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
deleted file mode 100644
index 8a5dd39ae1e..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Include xorg-server.h to fix build errors seen with glibc 2.20
-
-In file included from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/string.h:634:0,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/i586-oe-linux/xf86-video-intel/2_2.99.912-r0/xf86-video-intel-2.99.912/src/backlight.c:39:
-/home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
- strndup(const char *str, size_t n);
- ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: xf86-video-intel-2.99.912/src/backlight.c
-===================================================================
---- xf86-video-intel-2.99.912.orig/src/backlight.c	2014-04-09 10:41:18.000000000 -0700
-+++ xf86-video-intel-2.99.912/src/backlight.c	2014-08-28 18:52:25.524070587 -0700
-@@ -29,6 +29,7 @@
- #include "config.h"
- #endif
- 
-+#include <xorg-server.h>
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
deleted file mode 100644
index 3dddd334bf4..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-These modules are only used for tests that don't get installed, and the
-automatic detection without explicit dependencies means that a build can find
-e.g. xshmfence at configure time but then it's been removed from the sysroot by
-the time compile happens.
-
-As the tests don't get installed, just disable the checks.
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index bd654f3..78a0e0d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -279 +279 @@ fi
--PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
-+#PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 893f5ce3f64..a60da70840d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -14,13 +14,9 @@ PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
-           file://disable-x11-dri3.patch \
-           file://always_include_xorg_server.h.patch \
            file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
            "
 
-SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-SRC_URI[sha256sum] = "00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf9667c9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
-- 
2.11.0


