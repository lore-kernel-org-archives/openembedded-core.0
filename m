Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 25AFE75032
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:05:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 69-v6so14388366wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TVvNwWLwFWIclIwV5BSI2frVf5QtPwSIFL47eqCHpFg=;
	b=njFpn7YXaOfDgDHhVRKO45tJ+U6oNywG6zTYnClbWqE6FwmeIbBkMm3fP+eZE/pqmD
	yJN8QR+5enXYg1T7r0KPqW7oADq3HFuCN5ryRBocEfq3zwhGyAo+PUNvNmZWDw/2Nxlo
	OgVFWCsvqfiaAdGIXvIogrhGpsFchtax2iESYMhl4jxdbHky6dcpEbLymDgPWLR00Ktn
	f8JtItUJnY4UYh3sASkFBOhl5KSttcR2NReow3EKEzbhQpvV6rLcATD3jFZ2wYz1aVT7
	qgyRPMfs5xJmKKgdL/3eu1pIgaN+SyDn6E7DmiFubDmUhP3B6sKXO0FhyX8BqdFDdqWq
	LRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TVvNwWLwFWIclIwV5BSI2frVf5QtPwSIFL47eqCHpFg=;
	b=Vjvu3dl2Ou3zcnrpgQwwYC5MDYoIxFCetkPjbq1QnL1VyF1xpq63qy/qlv6NtRKWd8
	8dw5CamuFhV7dD/iYzjJWe0RbTVXftQ2cfZ/6/Am4Amj/TBoywJ1msXmvTzckKEQviG0
	qVK+Bl44Up5t0J2pjCSWlH7E3VtuXuOG91gy0xcLhwQasoji3gCqR7jx/LE5amOBHP9w
	fZbtbO0cfuZkCRYGPQ4zP4O3zdTtus+u7IhrTi4hQeQDjRy+wdfPKkUZyjwQfk0V7p8g
	k1CGQsvUbeomSOtRRXueKO89m/vCzA4LMbVyeJyUg/pdbTZ5LaYkuwiG54Up0BeDc8oY
	QqsQ==
X-Gm-Message-State: APt69E0DFIIPE7Gw0pnh7crdk/k8FM3uoZdhEWQVHB6X7SHWk0vr3+lE
	sA2fknmrS1ErsJ3X/o0HBYekNKxs
X-Google-Smtp-Source: ADUXVKIgHaB5F5o5B4OIoIqXRY7mRG4Rsyax3bNIrn3M4/Jm4zQh2VA89A9qxEI5k/6w1IPdFFVbpQ==
X-Received: by 2002:a1c:8590:: with SMTP id
	h138-v6mr7836193wmd.85.1529316352565; 
	Mon, 18 Jun 2018 03:05:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e63-v6sm11070510wma.46.2018.06.18.03.05.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 03:05:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:05:46 +0100
Message-Id: <20180618100546.7482-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xf86-video-omap: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 10:05:53 -0000

We were shipping the Debian fork of the original code, but that has disappeared
now that Alioth is down.  The driver didn't provide anything better than the
kernel and xserver's modesetting driver, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...apfb-from-from-crashing-when-pixelclock-o.patch |  37 ---
 ...a-large-CRTC-upper-limit-to-not-prune-lar.patch |  41 ---
 ...virtual-size-when-configuring-framebuffer.patch |  32 --
 .../xf86-video-omapfb/0003-force-plain-mode.patch  |  31 --
 .../xf86-video-omapfb/0004-blacklist-tv-out.patch  |  33 ---
 .../0005-Attempt-to-fix-VRFB.patch                 | 325 ---------------------
 ...0006-omapfb-port-to-new-xserver-video-API.patch | 272 -----------------
 .../0007-always_include_xorg_server.h.patch        |  48 ---
 .../xorg-driver/xf86-video-omapfb_git.bb           |  37 ---
 9 files changed, 856 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0007-always_include_xorg_server.h.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
deleted file mode 100644
index ac192192843..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 28c006c94e57ea71df11ec4fff79d7ffcfc4860f Mon Sep 17 00:00:00 2001
-From: Far McKon <FarMcKon@buglabs.net>
-Date: Tue, 3 May 2011 20:59:04 +0300
-Subject: [PATCH] Prevents omapfb from from crashing when pixelclock of 0 is
- sent to it.
-
-Due to a Linux design bug it is easy to get a pixelclock set to zero
-when changing displays at runtime.
-
-Upstream-Status: Pending
----
- src/omapfb-output.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/src/omapfb-output.c b/src/omapfb-output.c
-index f8b4db3..4d59265 100644
---- a/src/omapfb-output.c
-+++ b/src/omapfb-output.c
-@@ -125,8 +125,13 @@ OMAPFBOutputGetModes(xf86OutputPtr output)
- 	/* Only populate the native (current) mode */
- 	mode = calloc(1, sizeof(DisplayModeRec));
- 	mode->type      |= M_T_PREFERRED;
--	mode->Clock = PICOS2KHZ(ofb->state_info.pixclock);
--	mode->SynthClock = PICOS2KHZ(ofb->state_info.pixclock);
-+	if (ofb->state_info.pixclock == 0) {
-+		mode->Clock = 0;
-+		mode->SynthClock = 0;
-+	} else {
-+		mode->Clock = PICOS2KHZ(ofb->state_info.pixclock);
-+		mode->SynthClock = PICOS2KHZ(ofb->state_info.pixclock);
-+	}
- 	mode->HDisplay   = ofb->state_info.xres;
- 	mode->HSyncStart = mode->HDisplay
- 	                  + ofb->state_info.right_margin;
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
deleted file mode 100644
index 9fb01d438a1..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8fb7d0f99d4afbb574b30cb4f1e66a8f89d94ad5 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 26 Jan 2011 12:04:36 +0100
-Subject: [PATCH 1/6] Revert "Set a large CRTC upper limit to not prune larger
- resolutions"
-
-Picture is garbled after switching resolutions, so revert it.
-Virtual size too big, revert the commit 9c4d7592dcb7dc20a48a6f941d9d94bd73d34153.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/omapfb-crtc.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
-index 9aaa52f..cbeff35 100644
---- a/src/omapfb-crtc.c
-+++ b/src/omapfb-crtc.c
-@@ -190,13 +190,13 @@ OMAPFBCRTCInit(ScrnInfoPtr pScrn)
- 	 * In practise, this doesn't seem to be supported.
- 	 * (no way to setup the overlay offset/base address)
- 	 */
--	 /* FIXME: figure out what makes sense here. A known max resolution?
--	  * framebuffer size?
--	  */
- 	xf86CrtcSetSizeRange(pScrn,
--	                     8, 8, 2048, 2048);
-+	                     8, 8,
-+	                     ofb->state_info.xres_virtual,
-+	                     ofb->state_info.yres_virtual);
- 
- 	ofb->crtc = xf86CrtcCreate(pScrn, &OMAPFBCrtcFuncs);
-+
- }
- 
- 
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
deleted file mode 100644
index 683a9898328..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 855c333ac0d16350f895f1d1b9391e9cbb0b6db4 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 26 Jan 2011 13:27:20 +0100
-Subject: [PATCH 2/6] Revert "Set virtual size when configuring framebuffer"
-
-Virtual size too big, so revert it.
-
-This reverts commit 2653ef07883fbd1a5e7025f9300cf89b79ba429a.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/omapfb-crtc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
-index cbeff35..9655db2 100644
---- a/src/omapfb-crtc.c
-+++ b/src/omapfb-crtc.c
-@@ -98,8 +98,6 @@ OMAPFBCrtcCommitChangeMode (xf86CrtcPtr crtc)
- 	v = ofb->state_info;
- 	v.xres = mode->HDisplay;
- 	v.yres = mode->VDisplay;
--	v.xres_virtual = crtc->scrn->virtualX;
--	v.yres_virtual = crtc->scrn->virtualY;
- 	v.activate = FB_ACTIVATE_NOW;
- 	v.pixclock = KHZ2PICOS(mode->Clock ? mode->Clock : 56000);
- 	v.left_margin = mode->HTotal - mode->HSyncEnd;
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
deleted file mode 100644
index 67ea7c1a5f5..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 252f44c072d3447a32127fc9afe5d0d40f3c510e Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 26 Jan 2011 13:20:20 +0100
-Subject: [PATCH 3/6] force 'plain' mode
-
-The new DSS mode breaks XV, so force plain mode
-
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/omapfb-driver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
-index 018e040..48aa09c 100644
---- a/src/omapfb-driver.c
-+++ b/src/omapfb-driver.c
-@@ -326,7 +326,7 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
- 	OMAPFBProbeController(ofb->ctrl_name);
- 
- 	/* Do we have the DSS kernel API? */
--	if (stat(SYSFS_DSS_DIR, &st) == 0) {
-+	if (0) { //stat(SYSFS_DSS_DIR, &st) == 0) {
- 		ofb->dss = TRUE;
- 	} else {
- 		ofb->dss = FALSE;
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
deleted file mode 100644
index b0ac9a44c8e..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cfa46b67f59115f6d8ef9414af60380749ff3eb3 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 26 Jan 2011 13:21:12 +0100
-Subject: [PATCH 4/6] blacklist tv out
-
-The tv-out gets added last and the driver tries to reconfigure dvi to TV resolutions, which fails. so blacklist it
-
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/omapfb-output-dss.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/omapfb-output-dss.c b/src/omapfb-output-dss.c
-index 6cc52de..83cb711 100644
---- a/src/omapfb-output-dss.c
-+++ b/src/omapfb-output-dss.c
-@@ -205,6 +205,10 @@ OMAPFBDSSOutputDetect (xf86OutputPtr output)
- 	if(ofb->timings[idx][0] == '\0')
- 		return XF86OutputStatusDisconnected;
- 
-+	// Hack to disable the tv out
-+	if (strncmp(output->name, "tv", 2) == 0)
-+		return XF86OutputStatusDisconnected;
-+
- 	return XF86OutputStatusConnected;
- }
- 
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
deleted file mode 100644
index 67b284023d3..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
+++ /dev/null
@@ -1,325 +0,0 @@
-From 8b1f697a60e35ab82fffdabfaefdb45e9a9df379 Mon Sep 17 00:00:00 2001
-From: Eino-Ville Talvala <talvala@stanford.edu>
-Date: Tue, 23 Aug 2011 18:37:01 +0200
-Subject: [PATCH 5/6] Attempt to fix VRFB
-
-Upstream-Status: Pending
-
-http://dominion.thruhere.net/git/cgit.cgi/xf86-video-omapfb/commit/?h=koen/fixups&id=6833fc9f795265e4943d248103fbaf3463b515d6
-
-Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/image-format-conversions.c |  4 +--
- src/image-format-conversions.h |  2 +-
- src/omapfb-driver.c            | 28 +++++++++++++---
- src/omapfb-xv-blizzard.c       |  1 +
- src/omapfb-xv-generic.c        | 72 +++++++++++++++++++++++++++++++++---------
- src/omapfb-xv.c                |  3 ++
- 6 files changed, 88 insertions(+), 22 deletions(-)
-
-diff --git a/src/image-format-conversions.c b/src/image-format-conversions.c
-index dcefa9b..d43427d 100644
---- a/src/image-format-conversions.c
-+++ b/src/image-format-conversions.c
-@@ -38,13 +38,13 @@
- #include "image-format-conversions.h"
- 
- /* Basic line-based copy for packed formats */
--void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest)
-+void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest)
- {
- 	int i;
- 	int len = w * 2;
- 	for (i = 0; i < h; i++)
- 	{
--		memcpy(dest + i * len, src + i * stride, len);
-+		memcpy(dest + i * dst_stride, src + i * src_stride, len);
- 	}
- }
- 
-diff --git a/src/image-format-conversions.h b/src/image-format-conversions.h
-index 584896a..ba7caf2 100644
---- a/src/image-format-conversions.h
-+++ b/src/image-format-conversions.h
-@@ -27,7 +27,7 @@
- #include <stdint.h>
- 
- /* Basic line-based copy for packed formats */
--void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest);
-+void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest);
- 
- /* Basic C implementation of YV12/I420 to UYVY conversion */
- void uv12_to_uyvy(int w, int h, int y_pitch, int uv_pitch, uint8_t *y_p, uint8_t *u_p, uint8_t *v_p, uint8_t *dest);
-diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
-index 48aa09c..07989f5 100644
---- a/src/omapfb-driver.c
-+++ b/src/omapfb-driver.c
-@@ -66,6 +66,7 @@
- #define OMAPFB_VERSION 1000
- #define OMAPFB_DRIVER_NAME "OMAPFB"
- #define OMAPFB_NAME "omapfb"
-+#define ENFORCE_MODES
- 
- static Bool OMAPFBProbe(DriverPtr drv, int flags);
- static Bool OMAPFBPreInit(ScrnInfoPtr pScrn, int flags);
-@@ -105,11 +106,13 @@ static SymTabRec OMAPFBChipsets[] = {
- typedef enum {
- 	OPTION_ACCELMETHOD,
- 	OPTION_FB,
-+	OPTION_ROTATE,
- } FBDevOpts;
- 
- static const OptionInfoRec OMAPFBOptions[] = {
- 	{ OPTION_ACCELMETHOD,	"AccelMethod",	OPTV_STRING,	{0},	FALSE },
- 	{ OPTION_FB,		"fb",		OPTV_STRING,	{0},	FALSE },
-+	{ OPTION_ROTATE,	"rotation",	OPTV_STRING,	{0},	FALSE },
- 	{ -1,			NULL,		OPTV_NONE,	{0},	FALSE }
- };
- 
-@@ -286,6 +289,7 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
- {
- 	OMAPFBPtr ofb;
- 	EntityInfoPtr pEnt;
-+	char *rotate;
- 	rgb zeros = { 0, 0, 0 };
- 	struct stat st;
- 
-@@ -379,6 +383,8 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
- 	pScrn->progClock = TRUE;
- 	pScrn->chipset   = "omapfb";
- 	
-+	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Rotate test version 0.02\n");
-+	
- 	/* Start with configured virtual size */
- 	pScrn->virtualX = pScrn->display->virtualX;
- 	pScrn->virtualY = pScrn->display->virtualY;
-@@ -496,12 +502,21 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	ofb->CloseScreen = pScreen->CloseScreen;
- 	pScreen->CloseScreen = OMAPFBCloseScreen;
- 
-+	/* Enforce the default mode (this is silly I guess) */
-+#ifdef ENFORCE_MODES
-+	//xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Enforcing modes\n");
-+	//set_mode(ofb, &ofb->default_mode);
-+	//pScrn->displayWidth = ofb->fixed_info.line_length /
-+	//  (ofb->state_info.bits_per_pixel>>3); //ofb->state_info.xres;
-+#endif
-+
- 	/* Map our framebuffer memory */
-+	ofb->mem_info.size = ofb->fixed_info.line_length * ofb->state_info.yres;
- 	ofb->fb = mmap (NULL, ofb->mem_info.size,
- 	                PROT_READ | PROT_WRITE, MAP_SHARED,
- 	                ofb->fd, 0);
--	if (ofb->fb == NULL) {
--		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed\n");
-+	if (ofb->fb == MAP_FAILED) {
-+		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
- 		return FALSE;
- 	}
- 
-@@ -578,8 +593,13 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	} else if (!ofb->dss) {
- 
- 		ofb->plane_info.enabled = 1;
--		ofb->plane_info.out_width = ofb->state_info.xres;
--		ofb->plane_info.out_height = ofb->state_info.yres;
-+		if (ofb->state_info.rotate == 0 || ofb->state_info.rotate == 2) {
-+			ofb->plane_info.out_width = ofb->state_info.xres;
-+			ofb->plane_info.out_height = ofb->state_info.yres;
-+		} else {
-+			ofb->plane_info.out_width = ofb->state_info.yres;
-+			ofb->plane_info.out_height = ofb->state_info.xres;
-+		}
- 
- 		if (ioctl (ofb->fd, OMAPFB_SETUP_PLANE, &ofb->plane_info)) {
- 			xf86DrvMsg(scrnIndex, X_ERROR,
-diff --git a/src/omapfb-xv-blizzard.c b/src/omapfb-xv-blizzard.c
-index 406ffc6..b71d2aa 100644
---- a/src/omapfb-xv-blizzard.c
-+++ b/src/omapfb-xv-blizzard.c
-@@ -220,6 +220,7 @@ int OMAPFBXVPutImageBlizzard (ScrnInfoPtr pScrn,
- 			packed_line_copy(src_w & ~3,
- 			                 src_h & ~3,
- 			                 ((src_w + 1) & ~1) * 2,
-+					 ofb->port->fixed_info.line_length,
- 			                 (uint8_t*)buf,
- 			                 (uint8_t*)ofb->port->fb);
- 			break;
-diff --git a/src/omapfb-xv-generic.c b/src/omapfb-xv-generic.c
-index e6f89fe..b33f344 100644
---- a/src/omapfb-xv-generic.c
-+++ b/src/omapfb-xv-generic.c
-@@ -62,7 +62,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
- {
- 	OMAPFBPtr ofb = OMAPFB(pScrn);
- 
--	/* The memory size is already set in OMAPFBXVQueryImageAttributes */
-+	/* The memory size is already set before we get here */
- 	if (ioctl(ofb->port->fd, OMAPFB_SETUP_MEM, &ofb->port->mem_info) != 0) {
- 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
- 		           "Failed to allocate video plane memory\n");
-@@ -73,19 +73,20 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
- 	ofb->port->fb = mmap (NULL, ofb->port->mem_info.size,
- 	                PROT_READ | PROT_WRITE, MAP_SHARED,
- 	                ofb->port->fd, 0);
--	if (ofb->port->fb == NULL) {
-+	if (ofb->port->fb == MAP_FAILED) {
- 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
- 		           "Mapping video memory failed\n");
- 		return XvBadAlloc;
- 	}
- 
- 	/* Update the state info */
-+	/* Let's not - it's bad
- 	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
- 	{
- 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
- 		return XvBadAlloc;
- 	}
--
-+	*/
- 	return Success;
- }
- 
-@@ -93,6 +94,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
- int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
- {
- 	OMAPFBPtr ofb = OMAPFB(pScrn);
-+	int ret;
- 
- 	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
- 	{
-@@ -104,6 +106,31 @@ int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
- 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
- 		return XvBadAlloc;
- 	}
-+	/* Changing rotation/nonstd flags can change the fixed info! */
-+	if (ioctl (ofb->port->fd, FBIOGET_FSCREENINFO, &ofb->port->fixed_info))
-+	{
-+		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
-+		return XvBadAlloc;
-+	}
-+	/* Correct fixed info requires recalculation of needed memory */
-+	ofb->port->mem_info.size = ofb->port->fixed_info.line_length * ofb->port->state_info.yres;
-+
-+	/* Allocate buffer memory */
-+	ret = OMAPXVAllocPlane(pScrn);
-+	if (ret != Success)
-+		return ret;
-+
-+	/* Workaround for reset of mode after memory allo */
-+	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
-+	{
-+		xf86Msg(X_ERROR, "%s: setting state info failed\n", __FUNCTION__);
-+		return XvBadAlloc;
-+	}
-+	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
-+	{
-+		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
-+		return XvBadAlloc;
-+	}
- 
- 	if(ioctl(ofb->port->fd, OMAPFB_SETUP_PLANE,
- 	   &ofb->port->plane_info) != 0) {
-@@ -124,6 +151,8 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
-                              DrawablePtr pDraw)
- {
- 	OMAPFBPtr ofb = OMAPFB(pScrn);
-+	short drw_temp;
-+	short rot_xres, rot_yres;
- 
- 	if (!ofb->port->plane_info.enabled
- 	 || ofb->port->update_window.x != src_x
-@@ -163,13 +192,6 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
- 			return Success;
- 		}
- 
--		/* If we don't have the plane running, enable it */
--		if (!ofb->port->plane_info.enabled) {
--			ret = OMAPXVAllocPlane(pScrn);
--			if (ret != Success)
--				return ret;
--		}
--
- 		/* Set up the state info, xres and yres will be used for
- 		 * scaling to the values in the plane info struct
- 		 */
-@@ -179,12 +201,31 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
- 		ofb->port->state_info.yres_virtual = 0;
- 		ofb->port->state_info.xoffset = 0;
- 		ofb->port->state_info.yoffset = 0;
--		ofb->port->state_info.rotate = 0;
-+		//ofb->port->state_info.rotate = 0;
- 		ofb->port->state_info.grayscale = 0;
- 		ofb->port->state_info.activate = FB_ACTIVATE_NOW;
- 		ofb->port->state_info.bits_per_pixel = 0;
- 		ofb->port->state_info.nonstd = xv_to_omapfb_format(image);
- 
-+		/* Plane info does not rotate with state_info */
-+		if (ofb->port->state_info.rotate == 1 ||
-+		  ofb->port->state_info.rotate == 3) {
-+			drw_temp = drw_x;
-+			drw_x = drw_y;
-+			drw_y = drw_temp;
-+
-+			drw_temp = drw_w;
-+			drw_w = drw_h;
-+			drw_h = drw_temp;
-+
-+			rot_xres = ofb->port->state_info.yres;
-+			rot_yres = ofb->port->state_info.xres;
-+		} else {
-+			rot_xres = ofb->port->state_info.xres;
-+			rot_yres = ofb->port->state_info.yres;
-+		}
-+
-+
- 		/* Set up the video plane info */
- 		ofb->port->plane_info.enabled = 1;
- 		ofb->port->plane_info.pos_x = drw_x;
-@@ -193,13 +234,13 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
- 		ofb->port->plane_info.out_height = drw_h & ~15;
- 
- 		/* Cap output to screen size */
--		if (ofb->port->plane_info.out_width > ofb->state_info.xres) {
-+		if (ofb->port->plane_info.out_width > rot_xres) {
- 			ofb->port->plane_info.pos_x = 0;
--			ofb->port->plane_info.out_width = ofb->state_info.xres;
-+			ofb->port->plane_info.out_width = rot_xres;
- 		}
--		if (ofb->port->plane_info.out_height > ofb->state_info.yres) {
-+		if (ofb->port->plane_info.out_height > rot_yres) {
- 			ofb->port->plane_info.pos_y = 0;
--			ofb->port->plane_info.out_height = ofb->state_info.yres;
-+			ofb->port->plane_info.out_height = rot_yres;
- 		}
- 
- 		ret = OMAPXVSetupVideoPlane(pScrn);
-@@ -223,6 +264,7 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
- 			packed_line_copy(src_w & ~15,
- 			                 src_h & ~15,
- 			                 ((src_w + 1) & ~1) * 2,
-+			                 ofb->port->fixed_info.line_length,
- 			                 (uint8_t*)buf,
- 			                 (uint8_t*)ofb->port->fb);
- 			break;
-diff --git a/src/omapfb-xv.c b/src/omapfb-xv.c
-index 1df651e..0fee2c6 100644
---- a/src/omapfb-xv.c
-+++ b/src/omapfb-xv.c
-@@ -169,8 +169,11 @@ static int OMAPFBXVQueryImageAttributes (ScrnInfoPtr pScrn,
- 	h = *height;
- 
- 	w = (w + 1) & ~1;
-+
-+	/* Can't calculate these here - don't know line length
- 	ofb->port->mem_info.size = w << 1;
- 	ofb->port->mem_info.size *= h;
-+	*/
- 
- 	return size;
- }
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
deleted file mode 100644
index d56729987ca..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
+++ /dev/null
@@ -1,272 +0,0 @@
-From 803ecf2909949e6152f4a81b6cbb92a4430679ac Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 23 Nov 2012 00:31:06 +0100
-Subject: [PATCH 6/6] omapfb: port to new xserver video API
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/compat-api.h    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- src/omapfb-driver.c | 41 ++++++++++++-----------
- 2 files changed, 118 insertions(+), 19 deletions(-)
- create mode 100644 src/compat-api.h
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-new file mode 100644
-index 0000000..b1591b1
---- /dev/null
-+++ b/src/compat-api.h
-@@ -0,0 +1,96 @@
-+/*
-+ * Copyright 2012 Red Hat, Inc.
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a
-+ * copy of this software and associated documentation files (the "Software"),
-+ * to deal in the Software without restriction, including without limitation
-+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+ * and/or sell copies of the Software, and to permit persons to whom the
-+ * Software is furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice (including the next
-+ * paragraph) shall be included in all copies or substantial portions of the
-+ * Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+ * DEALINGS IN THE SOFTWARE.
-+ *
-+ * Author: Dave Airlie <airlied@redhat.com>
-+ */
-+
-+/* this file provides API compat between server post 1.13 and pre it,
-+   it should be reused inside as many drivers as possible */
-+#ifndef COMPAT_API_H
-+#define COMPAT_API_H
-+
-+#ifndef GLYPH_HAS_GLYPH_PICTURE_ACCESSOR
-+#define GetGlyphPicture(g, s) GlyphPicture((g))[(s)->myNum]
-+#define SetGlyphPicture(g, s, p) GlyphPicture((g))[(s)->myNum] = p
-+#endif
-+
-+#ifndef XF86_HAS_SCRN_CONV
-+#define xf86ScreenToScrn(s) xf86Screens[(s)->myNum]
-+#define xf86ScrnToScreen(s) screenInfo.screens[(s)->scrnIndex]
-+#endif
-+
-+#ifndef XF86_SCRN_INTERFACE
-+
-+#define SCRN_ARG_TYPE int
-+#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = xf86Screens[(arg1)]
-+
-+#define SCREEN_ARG_TYPE int
-+#define SCREEN_PTR(arg1) ScreenPtr pScreen = screenInfo.screens[(arg1)]
-+
-+#define SCREEN_INIT_ARGS_DECL int index, ScreenPtr pScreen, int argc, char **argv
-+
-+#define BLOCKHANDLER_ARGS_DECL int arg, pointer blockData, pointer pTimeout, pointer pReadmask
-+#define BLOCKHANDLER_ARGS arg, blockData, pTimeout, pReadmask
-+
-+#define CLOSE_SCREEN_ARGS_DECL int scrnIndex, ScreenPtr pScreen
-+#define CLOSE_SCREEN_ARGS scrnIndex, pScreen
-+
-+#define ADJUST_FRAME_ARGS_DECL int arg, int x, int y, int flags
-+
-+#define SWITCH_MODE_ARGS_DECL int arg, DisplayModePtr mode, int flags
-+
-+#define FREE_SCREEN_ARGS_DECL int arg, int flags
-+#define FREE_SCREEN_ARGS(x) (x)->scrnIndex, 0
-+
-+#define VT_FUNC_ARGS_DECL int arg, int flags
-+#define VT_FUNC_ARGS(flags) pScrn->scrnIndex, (flags)
-+
-+#define XF86_ENABLEDISABLEFB_ARG(x) ((x)->scrnIndex)
-+#else
-+#define SCRN_ARG_TYPE ScrnInfoPtr
-+#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = (arg1)
-+
-+#define SCREEN_ARG_TYPE ScreenPtr
-+#define SCREEN_PTR(arg1) ScreenPtr pScreen = (arg1)
-+
-+#define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
-+
-+#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
-+#define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
-+
-+#define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
-+#define CLOSE_SCREEN_ARGS pScreen
-+
-+#define ADJUST_FRAME_ARGS_DECL ScrnInfoPtr arg, int x, int y
-+#define SWITCH_MODE_ARGS_DECL ScrnInfoPtr arg, DisplayModePtr mode
-+
-+#define FREE_SCREEN_ARGS_DECL ScrnInfoPtr arg
-+#define FREE_SCREEN_ARGS(x) (x)
-+
-+#define VT_FUNC_ARGS_DECL ScrnInfoPtr arg
-+#define VT_FUNC_ARGS(flags) pScrn
-+
-+#define XF86_ENABLEDISABLEFB_ARG(x) (x)
-+
-+#endif
-+
-+#endif
-diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
-index 07989f5..486ffa4 100644
---- a/src/omapfb-driver.c
-+++ b/src/omapfb-driver.c
-@@ -44,6 +44,8 @@
- 
- #include "exa.h"
- 
-+#include "compat-api.h"
-+
- #ifdef HAVE_XEXTPROTO_71
- #include <X11/extensions/dpmsconst.h>
- #else
-@@ -70,10 +72,10 @@
- 
- static Bool OMAPFBProbe(DriverPtr drv, int flags);
- static Bool OMAPFBPreInit(ScrnInfoPtr pScrn, int flags);
--static Bool OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv);
--static Bool OMAPFBEnterVT(int scrnIndex, int flags);
--static void OMAPFBLeaveVT(int scrnIndex, int flags);
--static Bool OMAPFBSwitchMode(int scrnIndex, DisplayModePtr mode, int flags);
-+static Bool OMAPFBScreenInit(SCREEN_INIT_ARGS_DECL);
-+static Bool OMAPFBEnterVT(VT_FUNC_ARGS_DECL);
-+static void OMAPFBLeaveVT(VT_FUNC_ARGS_DECL);
-+static Bool OMAPFBSwitchMode(SWITCH_MODE_ARGS_DECL);
- 
- static Bool
- OMAPFBEnsureRec(ScrnInfoPtr pScrn)
-@@ -481,7 +483,7 @@ OMAPFBXvScreenInit(ScreenPtr pScreen)
- }
- 
- static Bool
--OMAPFBCloseScreen(int scrnIndex, ScreenPtr pScreen)
-+OMAPFBCloseScreen(CLOSE_SCREEN_ARGS_DECL)
- {
- 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
- 	OMAPFBPtr ofb = OMAPFB(pScrn);
-@@ -490,11 +492,11 @@ OMAPFBCloseScreen(int scrnIndex, ScreenPtr pScreen)
- 
- 	pScreen->CloseScreen = ofb->CloseScreen;
- 	
--	return (*pScreen->CloseScreen)(scrnIndex, pScreen);
-+	return (*pScreen->CloseScreen)(CLOSE_SCREEN_ARGS);
- }
- 
- static Bool
--OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
-+OMAPFBScreenInit(SCREEN_INIT_ARGS_DECL)
- {
- 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
- 	OMAPFBPtr ofb = OMAPFB(pScrn);
-@@ -516,7 +518,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	                PROT_READ | PROT_WRITE, MAP_SHARED,
- 	                ofb->fd, 0);
- 	if (ofb->fb == MAP_FAILED) {
--		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
- 		return FALSE;
- 	}
- 
-@@ -526,7 +528,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	/* Only support TrueColor for now */
- 	if (!miSetVisualTypes(pScrn->depth, TrueColorMask,
- 		pScrn->rgbBits, pScrn->defaultVisual)) {
--		xf86DrvMsg(scrnIndex, X_ERROR, "visual type setup failed"
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "visual type setup failed"
- 		           " for %d bits per pixel [1]\n",
- 		           pScrn->bitsPerPixel);
- 		return FALSE;
-@@ -534,7 +536,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 
- 	/* Set up pixmap depth information */
- 	if (!miSetPixmapDepths()) {
--		xf86DrvMsg(scrnIndex,X_ERROR,"pixmap depth setup failed\n");
-+		xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"pixmap depth setup failed\n");
- 		return FALSE;
- 	}
- 
-@@ -546,7 +548,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	                  pScrn->virtualY, pScrn->xDpi,
- 	                  pScrn->yDpi, pScrn->displayWidth,
- 	                  pScrn->bitsPerPixel)) {
--		xf86DrvMsg(scrnIndex, X_ERROR, "fbScreenInit failed\n");
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "fbScreenInit failed\n");
- 		return FALSE;
- 	}
- 
-@@ -567,7 +569,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 
- 	/* Initialize XRender fallbacks */
- 	if (!fbPictureInit(pScreen, NULL, 0)) {
--		xf86DrvMsg(scrnIndex, X_ERROR, "fbPictureInit failed\n");
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "fbPictureInit failed\n");
- 		return FALSE;
- 	}
- 	
-@@ -579,7 +581,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 
- 	/* Initialize default colormap */
- 	if (!miCreateDefColormap(pScreen)) {
--		xf86DrvMsg(scrnIndex, X_ERROR,
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
- 		           "creating default colormap failed\n");
- 		return FALSE;
- 	}
-@@ -589,7 +591,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 		/* This is non-fatal since we might be running against older
- 		 * kernel driver in which case we only do basic 2D stuff...
- 		 */
--		xf86DrvMsg(scrnIndex, X_ERROR, "Reading plane info failed\n");
-+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "Reading plane info failed\n");
- 	} else if (!ofb->dss) {
- 
- 		ofb->plane_info.enabled = 1;
-@@ -602,7 +604,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 		}
- 
- 		if (ioctl (ofb->fd, OMAPFB_SETUP_PLANE, &ofb->plane_info)) {
--			xf86DrvMsg(scrnIndex, X_ERROR,
-+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
- 			            "%s: Plane setup failed: %s\n",
- 			            __FUNCTION__, strerror(errno));
- 			return FALSE;
-@@ -645,9 +647,10 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
- 	return TRUE;
- }
- 
--static Bool OMAPFBSwitchMode(int scrnIndex, DisplayModePtr mode, int flags)
-+static Bool OMAPFBSwitchMode(SWITCH_MODE_ARGS_DECL)
- {
--	return xf86SetSingleMode (xf86Screens[scrnIndex], mode, RR_Rotate_0);
-+	SCRN_INFO_PTR(arg);
-+	return xf86SetSingleMode (pScrn, mode, RR_Rotate_0);
- }
- 
- void
-@@ -699,14 +702,14 @@ OMAPFBPrintCapabilities(ScrnInfoPtr pScrn,
- /*** Unimplemented: */
- 
- static Bool
--OMAPFBEnterVT(int scrnIndex, int flags)
-+OMAPFBEnterVT(VT_FUNC_ARGS_DECL)
- {
- 	xf86Msg(X_NOT_IMPLEMENTED, "%s\n", __FUNCTION__);
- 	return TRUE;
- }
- 
- static void
--OMAPFBLeaveVT(int scrnIndex, int flags)
-+OMAPFBLeaveVT(VT_FUNC_ARGS_DECL)
- {
- 	xf86Msg(X_NOT_IMPLEMENTED, "%s\n", __FUNCTION__);
- }
--- 
-1.8.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0007-always_include_xorg_server.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0007-always_include_xorg_server.h.patch
deleted file mode 100644
index dc0b9b3f413..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0007-always_include_xorg_server.h.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Fix errors with glibc 2.20
-
-In file included from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/string.h:634:0,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:53,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/misc.h:115,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/xf86str.h:37,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/xf86.h:44,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/i586-oe-linux/xf86-video-omapfb/2_0.1.1+gitrAUTOINC+28c006c94e-r21.7/git/src/omapfb-xv-blizzard.c:33:
-/home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
- strndup(const char *str, size_t n);
- ^
-In file included from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/string.h:634:0,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:53,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/misc.h:115,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/xf86str.h:37,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/xf86.h:44,
-                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/i586-oe-linux/xf86-video-omapfb/2_0.1.1+gitrAUTOINC+28c006c94e-r21.7/git/src/omapfb-xv-generic.c:28:
-/home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
- strndup(const char *str, size_t n);
- ^
-
-Singed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: git/src/omapfb-xv-blizzard.c
-===================================================================
---- git.orig/src/omapfb-xv-blizzard.c	2014-08-28 05:16:25.684070587 -0700
-+++ git/src/omapfb-xv-blizzard.c	2014-08-28 19:05:39.440070587 -0700
-@@ -30,6 +30,7 @@
-  *  -
-  */
- 
-+#include <xorg-server.h>
- #include "xf86.h"
- #include "xf86_OSlib.h"
- #include "xf86xv.h"
-Index: git/src/omapfb-xv-generic.c
-===================================================================
---- git.orig/src/omapfb-xv-generic.c	2014-08-28 05:16:25.684070587 -0700
-+++ git/src/omapfb-xv-generic.c	2014-08-28 19:05:51.780070587 -0700
-@@ -25,6 +25,7 @@
-  * Generic functions for the XV driver
-  */
- 
-+#include <xorg-server.h>
- #include "xf86.h"
- #include "xf86_OSlib.h"
- #include "xf86xv.h"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
deleted file mode 100644
index 7ebb960f116..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
-
-DESCRIPTION = "omapfb driver supports the basic Texas Instruments OMAP \
-framebuffer."
-
-LICENSE = "MIT-X & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
-DEPENDS += "virtual/libx11"
-
-SRCREV = "33e36c12dde336edbdd34626dd8adfcaebc8fbb8"
-PR = "${INC_PR}.7"
-PV = "0.1.1+gitr${SRCPV}"
-
-# Blacklist debian-specific tags in upstream version check
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)(?!-)"
-
-SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
-  file://0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch \
-  file://0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch \
-  file://0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch \
-  file://0003-force-plain-mode.patch \
-  file://0004-blacklist-tv-out.patch \
-  file://0005-Attempt-to-fix-VRFB.patch \
-  file://0006-omapfb-port-to-new-xserver-video-API.patch \
-  file://0007-always_include_xorg_server.h.patch \
-"
-
-S = "${WORKDIR}/git"
-
-CFLAGS += " -I${STAGING_INCDIR}/xorg "
-
-# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
-do_compile_prepend_armv7a () {
-        sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
-}
-- 
2.11.0


