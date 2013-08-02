Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2350B6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219356"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:25 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:56 +0300
Message-Id: <d887bba5aa48a0d530ed037c48a33fe805603c2b.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 7/7] gstreamer1.0-plugins-bad: upgrade to v1.0.9
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:25 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc        | 2 --
 ...amer1.0-plugins-bad_1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} (75%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 38cf512..a36335a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -7,8 +7,6 @@ DEPENDS += "gstreamer1.0-plugins-base bzip2"
 SRC_URI[md5sum] = "d1493d1219b836a8cbf54f4fba962420"
 SRC_URI[sha256sum] = "5f49e6353fdc855834b5beb054b3a47ef5fa558006c7eda6d2ec07b36315c2ab"
 
-PR = "r1"
-
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 inherit gettext
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
similarity index 75%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
index bca3567..9ce7991 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-SRC_URI[md5sum] = "d1493d1219b836a8cbf54f4fba962420"
-SRC_URI[sha256sum] = "5f49e6353fdc855834b5beb054b3a47ef5fa558006c7eda6d2ec07b36315c2ab"
+SRC_URI[md5sum] = "569e5122fd7bfd7bd861a537f0a28c60"
+SRC_URI[sha256sum] = "69d236b1d8188270a3f51f6710146d0ca63c2f1a9f6cfbab3399ef01b9498f75"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.8.1.2


