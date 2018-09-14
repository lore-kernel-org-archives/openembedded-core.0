Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id AE302799CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:04:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id t84-v6so4613863pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=e7zGOqbFnLkGBt66Cxw9evijM2LNEyyp/FPEFFikQzA=;
	b=iVXscZfUIvO2ayS/yuDIGMWrnSftypSGKxViBwRJZ3Y6U0g96svF/oyHIdKyD0tvAo
	klT+dQHDr04VlXpWT9rk0BTIxpqiwtZH6egJkwn9U9LuHj8dQVCmE7N8fxLEb56GeaSU
	oG7tL3vBPN58PlYjHi677ugaA4Jf0ZuByieZbYz7QXnHqxycv7p2RKu/IsjAGLoKwDK/
	Fh6EmA2uE1ru+q5w6MCwqmcgJDjqkIHbkypgadx2h4y99CUgGdMCCAQjlNOxH9V1KfQF
	Jmi5TQNbo/P6s+YuzAieLB8i+LhYnjI3vEvNdXUuB9ParSFHdDAXMu9KXpHhPaLEbd0s
	aICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e7zGOqbFnLkGBt66Cxw9evijM2LNEyyp/FPEFFikQzA=;
	b=OL+6fZkMH4O4XTEQ0dYFszli2hMLzRRxpasR+H+HfRYJ3A9QEO6lO7Ry43z9kHgMWK
	DFxcViaUQKXp6iCJTmGXtWi1Q6D0miByXzTrpfGNP/57zNsYSzl9HPkdI+mf3hHJqP44
	zFEhaA/NGPX+13GwaJvbX3IK73LPKI+iS1oIAJLeUoNbarlZeiCuBZmTNpCDuRYI8KR5
	JDB6hrBvxmRWyN1hPnxVYpK1koIPjLxJl5kSemhH3vm+nHhtyN2lywU+1cX/Q1r/6ceO
	f838XDwR0RGfOe10NRf0XmNHyChSKoLDsExEBkb0shbwVqwDHxsBv7+d7sHR9I73CNKa
	/diw==
X-Gm-Message-State: APzg51BMsqNMvwGWt0MhWK5o1N2Wo5A7k6I+li2aEQ5jnLdwT3s8P1g+
	b+ogpPhv3gdTNmw5EVyPwCk=
X-Google-Smtp-Source: ANB0Vdbdbd/tanlmnLZbyPlLnxTwGjpZbwIwxC8zp0USPllhCxdCGD8T972iyiHrH0OnjKHXEvrL9w==
X-Received: by 2002:a63:1f0a:: with SMTP id
	f10-v6mr12407048pgf.66.1536941047539; 
	Fri, 14 Sep 2018 09:04:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6807:cebe:ef5d:c52e])
	by smtp.gmail.com with ESMTPSA id
	70-v6sm10519620pfz.27.2018.09.14.09.04.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 09:04:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 09:04:03 -0700
Message-Id: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
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
X-List-Received-Date: Fri, 14 Sep 2018 16:04:06 -0000

removed included patch

Refresh 0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC
Remove 0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...NULL-value-detection-for-ID_INPUT-being-u.patch | 40 -------------------
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++----
 ...003-modesetting-Fix-16-bit-depth-bpp-mode.patch | 46 ----------------------
 .../xorg-xserver/xserver-xorg_1.19.6.bb            | 33 ----------------
 .../xorg-xserver/xserver-xorg_1.20.1.bb            | 31 +++++++++++++++
 5 files changed, 40 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
deleted file mode 100644
index 964d5dd..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a309323328d9d6e0bf5d9ea1d75920e53b9beef3 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Fri, 5 Jan 2018 11:58:42 +1000
-Subject: [PATCH] config: fix NULL value detection for ID_INPUT being unset
-
-Erroneous condition caused us to keep going with all devices that didn't have
-ID_INPUT set.
-
-Fixes: 5aad81445c8c3d6
-Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=104382
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-Upstream-status: Backport
-https://patchwork.freedesktop.org/patch/196090/
-Affects: < 1.20.0
-[Yocto # 12899]
-
-Signed-off-by: Armin Kuster <akuser808@gmail.com>
-
----
- config/udev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/udev.c b/config/udev.c
-index e198e8609..3a73189e2 100644
---- a/config/udev.c
-+++ b/config/udev.c
-@@ -135,7 +135,7 @@ device_added(struct udev_device *udev_device)
- #endif
- 
-     value = udev_device_get_property_value(udev_device, "ID_INPUT");
--    if (value && !strcmp(value, "0")) {
-+    if (!value || !strcmp(value, "0")) {
-         LogMessageVerb(X_INFO, 10,
-                        "config/udev: ignoring device %s without "
-                        "property ID_INPUT set\n", path);
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
index 16ec3ed..020a1cf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
@@ -1,12 +1,13 @@
-Discover monotonic clock using compile-time check
+From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 12 Dec 2016 12:11:39 +0200
+Subject: [PATCH] Discover monotonic clock using compile-time check
 
 monotonic clock check does not work when cross-compiling.
 
 Upstream-Status: Denied [Does not work on OpenBSD]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
-
-
 Original patch follows:
 
 When xorg-xserver is being cross-compiled, there is currently no way
@@ -21,15 +22,16 @@ monotonic clock is available. This check can run just fine when we are
 cross-compiling.
 
 Signed-off-by: David James <davidjames at google.com>
+
 ---
  configure.ac | 17 +++++++----------
  1 file changed, 7 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f7ab48c..26e85cd 100644
+index 2b21667..786e002 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
+@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
          CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
      fi
  
@@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
 -       [MONOTONIC_CLOCK="cross compiling"])
 +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
  
-     LIBS="$LIBS_SAVE"
-     CPPFLAGS="$CPPFLAGS_SAVE"
--- 
-2.1.4
-
+     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
+         AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch
deleted file mode 100644
index 5243761..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-modesetting-Fix-16-bit-depth-bpp-mode.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5028ef46ff4ab0930224b71024a7349b05610d42 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Thu, 22 Dec 2016 15:41:06 +0100
-Subject: [PATCH] modesetting: Fix 16 bit depth/bpp mode
-
-When setting DefaultDepth to 16 in the Screen section, the current
-code requests a 32 bpp framebuffer, however the X-Server seems to
-assumes 16 bpp.
-
-Fixes commit 21217d02168d ("modesetting: Implement 32->24 bpp
-conversion in shadow update")
-
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-
-Upstream-Status: Submitted [1]
-
-[1] https://lists.x.org/archives/xorg-devel/2016-December/052113.html
----
- hw/xfree86/drivers/modesetting/driver.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/hw/xfree86/drivers/modesetting/driver.c b/hw/xfree86/drivers/modesetting/driver.c
-index d7030e5..647ad83 100644
---- a/hw/xfree86/drivers/modesetting/driver.c
-+++ b/hw/xfree86/drivers/modesetting/driver.c
-@@ -930,7 +930,7 @@ PreInit(ScrnInfoPtr pScrn, int flags)
-                    "Using 24bpp hw front buffer with 32bpp shadow\n");
-         defaultbpp = 32;
-     } else {
--        ms->drmmode.kbpp = defaultbpp;
-+        ms->drmmode.kbpp = 0;
-     }
-     bppflags = PreferConvert24to32 | SupportConvert24to32 | Support32bppFb;
- 
-@@ -950,6 +950,8 @@ PreInit(ScrnInfoPtr pScrn, int flags)
-         return FALSE;
-     }
-     xf86PrintDepthBpp(pScrn);
-+    if (!ms->drmmode.kbpp)
-+        ms->drmmode.kbpp = pScrn->bitsPerPixel;
- 
-     /* Process the options */
-     xf86CollectOptions(pScrn, NULL);
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
deleted file mode 100644
index 7e8a954..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require xserver-xorg.inc
-
-SRC_URI += "file://musl-arm-inb-outb.patch \
-            file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
-            file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
-            file://0003-Remove-check-for-useSIGIO-option.patch \
-            file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch \
-            "
-SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
-SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
-
-# These extensions are now integrated into the server, so declare the migration
-# path for in-place upgrades.
-
-RREPLACES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RPROVIDES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RCONFLICTS_${PN} = "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
new file mode 100644
index 0000000..2cbcd90
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
@@ -0,0 +1,31 @@
+require xserver-xorg.inc
+
+SRC_URI += "file://musl-arm-inb-outb.patch \
+            file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
+            file://0003-Remove-check-for-useSIGIO-option.patch \
+            file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
+            "
+SRC_URI[md5sum] = "e525846d1d0af5732ba835f2e2ec066d"
+SRC_URI[sha256sum] = "59c99fe86fe75b8164c6567bfc6e982aecc2e4a51e6fbac1b842d5d00549e918"
+
+# These extensions are now integrated into the server, so declare the migration
+# path for in-place upgrades.
+
+RREPLACES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RPROVIDES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RCONFLICTS_${PN} = "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
-- 
2.7.4


