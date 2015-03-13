Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E513A6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 12:49:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 13 Mar 2015 05:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,394,1422950400"; d="scan'208";a="691614168"
Received: from heimdall.fi.intel.com ([10.237.72.102])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2015 05:49:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 14:49:17 +0200
Message-Id: <1426250957-8466-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gst-player: Depend on -libav if commercial license is enabled
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
X-List-Received-Date: Fri, 13 Mar 2015 12:49:25 -0000

gstreamer1.0-libav makes AAC playback possible but is protected by
the "commercial" LICENSE_FLAGS: recommend -libav if those licenses
are enabled.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 988c407..1921467 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -32,4 +32,5 @@ RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
 RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
                          gstreamer1.0-plugins-good-meta \
                          gstreamer1.0-plugins-bad-meta \
+                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav ", "", d)} \
                          ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
-- 
2.1.4


