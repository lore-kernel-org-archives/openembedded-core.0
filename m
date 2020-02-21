Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AC200615EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:01:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:01:57 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067313"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:01:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:21 +0800
Message-Id: <1582250488-79398-6-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 06/13] gstreamer1.0-plugins-ugly: upgrade 1.16.1 -> 1.16.2
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
X-List-Received-Date: Fri, 21 Feb 2020 02:01:55 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1.0-plugins-ugly_1.16.1.bb => gstreamer1.0-plugins-ugly_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.1.bb => gstreamer1.0-plugins-ugly_1.16.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
index 30961d0..be10800 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
-SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
+SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
+SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.7.4


