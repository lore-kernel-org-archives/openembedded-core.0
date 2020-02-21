Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2A0615CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:01:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:01:54 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067265"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:01:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:18 +0800
Message-Id: <1582250488-79398-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 03/13] gstreamer1.0-plugins-base: upgrade 1.16.1 -> 1.16.2
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
X-List-Received-Date: Fri, 21 Feb 2020 02:01:52 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1.0-plugins-base_1.16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
index cf12ceb..6563b6f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
             file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
             "
-SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
-SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
+SRC_URI[md5sum] = "3fdb32823535799a748c1fc14f978e2c"
+SRC_URI[sha256sum] = "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.7.4


