Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4329A731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:15:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2016 03:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,322,1470726000"; d="scan'208";a="1049043020"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2016 03:15:30 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 13:15:29 +0300
Message-Id: <1473675329-16753-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] gst-player: specify PV
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
X-List-Received-Date: Mon, 12 Sep 2016 10:15:31 -0000

Define PV in order to avoid package version being plain "git". Use the
version number found from configure.ac plus the git revision.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 00ad941..2a4c9dc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://gst-player.desktop"
 
 SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
+PV = "0.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.6


