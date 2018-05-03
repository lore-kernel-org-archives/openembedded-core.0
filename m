Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F028B74802
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612777"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:56 +0800
Message-Id: <20180503081758.4661-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 10/12] gst-python: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:15 -0000

For changes, please see: https://cgit.freedesktop.org/gstreamer/gst-python/tree/ChangeLog

Also merge inc/bb since we have only one version now.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb    | 7 -------
 .../{gstreamer1.0-python.inc => gstreamer1.0-python_1.14.0.bb}     | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python.inc => gstreamer1.0-python_1.14.0.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
deleted file mode 100644
index faec3566c4..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require gstreamer1.0-python.inc
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f1fd046ea781736a794f9f552d77c50d"
-SRC_URI[sha256sum] = "20ce6af6615c9a440c1928c31259a78226516d06bf1a65f888c6d109826fa3ea"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
index 361f0bca41..1eb1a3f6f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.0.bb
@@ -1,7 +1,13 @@
 SUMMARY = "Python bindings for GStreamer 1.0"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
+
 LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "97782b2fde877f1d1d68c64f7db4f735"
+SRC_URI[sha256sum] = "e0b98111150aa3fcdeb6e228cd770995fbdaa8586fc02ec9b3273d4ae83399e6"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.14.1


