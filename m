Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 037EC782A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:16 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 30 Jun 2017 07:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="120881150"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2017 07:56:18 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 538C25800C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:17 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:19 +0300
Message-Id: <1498834581-12279-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/11] gstreamer1.0-libav: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:17 -0000

Upgrade to 1.12.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.1.bb
index e4bb477..5fceabe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            "
-SRC_URI[md5sum] = "e2bdd9fde6ca3ff7efffb93df121f4fd"
-SRC_URI[sha256sum] = "6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b"
+SRC_URI[md5sum] = "b34c46d1af8a1067543c45209d711b57"
+SRC_URI[sha256sum] = "55d7823fdf63195de991adfef32db4b8a8bef3cafa46115a951e590dc18a5077"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.4.0


