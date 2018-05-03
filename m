Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE1C974802
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612772"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:55 +0800
Message-Id: <20180503081758.4661-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 09/12] gst-omx: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:13 -0000

For changes, please see: https://cgit.freedesktop.org/gstreamer/gst-omx/tree/ChangeLog
Merge inc/bb since we only have one version now.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb  | 11 -----------
 .../{gstreamer1.0-omx.inc => gstreamer1.0-omx_1.14.0.bb}      | 10 +++++++++-
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx.inc => gstreamer1.0-omx_1.14.0.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
deleted file mode 100644
index 7f7eae3708..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-include gstreamer1.0-omx.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "eb8d5ae3b69cfeed9dc77c592106247e"
-SRC_URI[sha256sum] = "a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f"
-
-S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
index 5d9235104e..792b1e182d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
@@ -4,6 +4,15 @@ SECTION = "multimedia"
 
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "2bca3bd68540a97122450d78576ad2be"
+SRC_URI[sha256sum] = "4d43c354087cb77924982943e34e0d47294b5570304db11fd8b268b53bcff693"
+
+S = "${WORKDIR}/gst-omx-${PV}"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
@@ -11,7 +20,6 @@ inherit autotools pkgconfig gettext gtk-doc upstream-version-is-even
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
 GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
 
-- 
2.14.1


