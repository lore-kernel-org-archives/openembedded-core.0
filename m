Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B37B74802
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612748"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:52 +0800
Message-Id: <20180503081758.4661-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 06/12] gst-rtsp-server: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:10 -0000

* For changes, please see: https://gstreamer.freedesktop.org/releases/1.14/
* Merge inc/bb since there's only one version now.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb                  | 6 ------
 ...amer1.0-rtsp-server.inc => gstreamer1.0-rtsp-server_1.14.0.bb} | 8 ++++++--
 2 files changed, 6 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server.inc => gstreamer1.0-rtsp-server_1.14.0.bb} (79%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
deleted file mode 100644
index da68dcba20..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "ad70a9735f58da21d0f5cedf48ccadd3"
-SRC_URI[sha256sum] = "7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
similarity index 79%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
index 3776f92917..64906e1abb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
@@ -2,6 +2,7 @@ SUMMARY = "A library on top of GStreamer for building an RTSP server"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
@@ -10,7 +11,11 @@ PNREAL = "gst-rtsp-server"
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-           file://gtk-doc-tweaks.patch"
+           file://gtk-doc-tweaks.patch \
+           "
+
+SRC_URI[md5sum] = "8a505c88f7469c3a0d1e9f4e9a315e53"
+SRC_URI[sha256sum] = "6b65a077bed815f6d3157ebea503cc9f3c32d289af2756b7ff7e3958744d9756"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
@@ -28,4 +33,3 @@ delete_pkg_m4_file() {
 }
 
 do_configure[prefuncs] += " delete_pkg_m4_file"
-
-- 
2.14.1


