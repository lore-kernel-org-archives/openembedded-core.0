Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 58F2A78BFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087641"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:06 +0800
Message-Id: <20180808071515.25581-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 02/11] gstreamer1.0-plugins-base: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:19 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch | 8 ++++----
 ...plugins-base_1.14.1.bb => gstreamer1.0-plugins-base_1.14.2.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.14.1.bb => gstreamer1.0-plugins-base_1.14.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 128c7f8..bcada34 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -1,4 +1,4 @@
-From 4d6ea58f96b9744af8d899ddca22c2695ac74b5b Mon Sep 17 00:00:00 2001
+From 7022b87353a37b78bae7cf0106a4e47913bb5c97 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 5 Apr 2018 10:15:08 +0800
 Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
@@ -62,14 +62,14 @@ index 2922245..7fb65f2 100644
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg-export gstreamer-audio-@GST_API_VERSION@ \
 diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index a3bbc94..16f829f 100644
+index 4e77e8c..3276d7f 100644
 --- a/gst-libs/gst/gl/Makefile.am
 +++ b/gst-libs/gst/gl/Makefile.am
-@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+@@ -193,7 +193,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
  		--include=GstVideo-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
+-		--libtool="${LIBTOOL}" \
 +		--libtool="$(LIBTOOL)" \
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb
index 17f234e..dcea789 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb
@@ -21,8 +21,8 @@ SRC_URI = " \
             file://0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "c42154ab6f85c59f0e449d8d7e290342"
-SRC_URI[sha256sum] = "1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc0b0db5"
+SRC_URI[md5sum] = "8bc790d623350cd8eac68d3a13d79f7d"
+SRC_URI[sha256sum] = "a4b7e80ba869f599307449b17c9e00b5d1e94d3ba1d8a1a386b8770b2ef01c7c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.7.4


