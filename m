Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 59B987453F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569616"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:07 +0800
Message-Id: <20180525062014.22022-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 05/12] gstreamer1.0-plugins-bad: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:33 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-bad_1.14.0.bb => gstreamer1.0-plugins-bad_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.0.bb => gstreamer1.0-plugins-bad_1.14.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
index 87f2d0367a..0e477e5a9c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
-SRC_URI[md5sum] = "555bbe7232fb4653c31b78e1f79068cf"
-SRC_URI[sha256sum] = "ed5e2badb6f2858f60017b93334d91fe58a0e3f85ed2f37f2e931416fafb4f9f"
+SRC_URI[md5sum] = "c2f963501fc6afc084c418894425dcfd"
+SRC_URI[sha256sum] = "2a77c6908032aafdf2cd2e5823fec948f16a25c2d1497a953828d762dc20d61a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.17.0


