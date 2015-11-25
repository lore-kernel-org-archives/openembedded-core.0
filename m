Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5B03C60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:02:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 05:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="606912463"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2015 05:02:09 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Wed, 25 Nov 2015 15:05:37 +0200
Message-Id: <21d1633f21cba7e686512da7bc843de7e3ccf3d7.1448455166.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
References: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448455166.git.jussi.kukkonen@intel.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/5] gstreamer1.0-plugins-good: Fix gudev dependency
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
X-List-Received-Date: Wed, 25 Nov 2015 13:02:14 -0000

libgudev is now it's own library (also provided by udev).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 1119e10..c2ada4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -20,7 +20,7 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
-- 
2.1.4


