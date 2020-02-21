Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7C59615FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:01:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:01:59 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067343"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:01:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:23 +0800
Message-Id: <1582250488-79398-8-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 08/13] gstreamer1.0-omx: upgrade 1.16.1 -> 1.16.2
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
X-List-Received-Date: Fri, 21 Feb 2020 02:01:58 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.16.1.bb => gstreamer1.0-omx_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.1.bb => gstreamer1.0-omx_1.16.2.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
index dfe4b69..f1bdbd2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
-SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
+SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
+SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.7.4


