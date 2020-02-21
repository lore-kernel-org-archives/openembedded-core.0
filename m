Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91E1C6154A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:01:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:01:55 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067281"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:01:54 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:19 +0800
Message-Id: <1582250488-79398-4-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 04/13] gstreamer1.0-plugins-good: upgrade 1.16.1 -> 1.16.2
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
X-List-Received-Date: Fri, 21 Feb 2020 02:01:53 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1.0-plugins-good_1.16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
index a6eb998..1b4db19 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
@@ -4,8 +4,8 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             "
 
-SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
-SRC_URI[sha256sum] = "9fbabe69018fcec707df0b71150168776040cde6c1a26bb5a82a136755fa8f1f"
+SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
+SRC_URI[sha256sum] = "40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.7.4


