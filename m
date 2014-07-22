Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEDE60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:39 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so56685wgg.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X4cg+xiMfR7Vy0W7EHBvh3/xedZO5gQlx6CSQspqtqE=;
	b=DubVrI9rFedj1Kj8PHhX+paFQl2Adj9gCaiYOXmiwCwhL6eXz60MAGPUjBgAdeNtEJ
	yLdIMbyjIIiZEx7+bjBXGGF0b1VKejy57T4TeRUeZaZP6t7CloXnxxcVm0+K83Vno7WP
	f1WAIBRqW044L8rZCEAAH1hjZpF+qhINr6mAaR/lC5iUlcLVPmGMvDV+rxGXrb/Qs1qp
	OET+v3OWz3j+F4MW2JGE0aXtpmpRwGV+UPyhtBqhxnnM151yGBna5gGIMY8mVGmcmtKp
	o4dfXICeMV1vKsls8+Cq0MckL/sxUbZGxsU+wzzbRA01fY7xL8WN1X1fwCsUFR/3MGTc
	PYAA==
X-Gm-Message-State: ALoCoQktM2lxJyKSTtvlTaLUHe1CqPVHMug6Q8FPodMl+muMzAawX/fdwAhBLpSY41ijhq5yO4gI
X-Received: by 10.180.84.7 with SMTP id u7mr17111524wiy.27.1406054320579;
	Tue, 22 Jul 2014 11:38:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:20 +0100
Message-Id: <1406054301-9027-10-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 10/11] libxft: upgrade to 2.3.2
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:40 -0000

Remove patch that has been merged upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libxft/freetype.patch                 |   39 --------------------
 .../xorg-lib/{libxft_2.3.1.bb => libxft_2.3.2.bb}  |    6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxft/freetype.patch
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.1.bb => libxft_2.3.2.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft/freetype.patch b/meta/recipes-graphics/xorg-lib/libxft/freetype.patch
deleted file mode 100644
index 9f1aa21..0000000
--- a/meta/recipes-graphics/xorg-lib/libxft/freetype.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f568fa5a8220fd06659c0f26a93adcc81a42917c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 2 Dec 2013 13:48:40 +0000
-Subject: [PATCH] xftglyphs: use recommend freetype inclusion
-
-FreeType recommends to use their special macros to include the headers, because
-it gives them the ability to move headers around.  They did this in 2.5.1 (yes,
-a point release) and this direct inclusion doesn't work anymore.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- src/xftglyphs.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/xftglyphs.c b/src/xftglyphs.c
-index 2f3dc5a..53302f0 100644
---- a/src/xftglyphs.c
-+++ b/src/xftglyphs.c
-@@ -21,10 +21,10 @@
-  */
- 
- #include "xftint.h"
--#include <freetype/ftoutln.h>
--#include <freetype/ftlcdfil.h>
--
--#include <freetype/ftsynth.h>
-+#include <ft2build.h>
-+#include FT_FREETYPE_H
-+#include FT_LCD_FILTER_H
-+#include FT_SYNTHESIS_H
- 
- /*
-  * Validate the memory info for a font
--- 
-1.8.5
-
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
index 16838f0..a967cdc 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
@@ -20,10 +20,8 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI += "file://freetype.patch"
-
-SRC_URI[md5sum] = "78d64dece560c9e8699199f3faa521c0"
-SRC_URI[sha256sum] = "7fce32b92dcb7b2869bed567af2abc7bbad0d5d6fcf471b8a3e137964a31bbbd"
+SRC_URI[md5sum] = "331b3a2a3a1a78b5b44cfbd43f86fcfe"
+SRC_URI[sha256sum] = "f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c"
 
 XORG_PN = "libXft"
 
-- 
1.7.10.4


