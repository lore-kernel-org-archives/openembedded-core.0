Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 90D8C74802
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612754"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:53 +0800
Message-Id: <20180503081758.4661-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 07/12] gstreamer-vaapi: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:11 -0000

For changes, please see gstreamer-vaapi specific section at:
https://gstreamer.freedesktop.org/releases/1.14/

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb      | 5 -----
 .../{gstreamer1.0-vaapi.inc => gstreamer1.0-vaapi_1.14.0.bb}        | 6 ++++--
 2 files changed, 4 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi.inc => gstreamer1.0-vaapi_1.14.0.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
deleted file mode 100644
index 1df2301792..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "2149982cdb348139bca946bb63766f4c"
-SRC_URI[sha256sum] = "1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
index abfcc65390..4f752a57b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.0.bb
@@ -9,12 +9,14 @@ FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALPN}", "${FILE_DIRNAME
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "libva"
-
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
           "
 
+SRC_URI[md5sum] = "248c3aafab59814e71eb4a6c334cb261"
+SRC_URI[sha256sum] = "e4e31f085ef289bf1049398f641345979d20a1b11a80285744bba98504991df2"
+
 S = "${WORKDIR}/${REALPN}-${PV}"
+DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
 inherit autotools pkgconfig gtk-doc distro_features_check upstream-version-is-even
 
-- 
2.14.1


