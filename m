Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B15CF731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 05:57:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2016 22:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,304,1470726000"; d="scan'208";a="166126727"
Received: from fsorel-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.23.35])
	by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2016 22:57:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 08:57:03 +0300
Message-Id: <1473400623-20500-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] gst-player: include SRCPV in PV
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
X-List-Received-Date: Fri, 09 Sep 2016 05:57:12 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-player_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 00ad941..4f9aa84 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://gst-player.desktop"
 
 SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
+PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.6


