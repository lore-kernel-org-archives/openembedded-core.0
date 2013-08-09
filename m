Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 105026B600
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:45 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808037"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:35 +0100
Message-Id: <a3e3f530bbc227257d34ce23b660617483f21c73.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] gst-ffmpeg: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Fri, 09 Aug 2013 08:59:45 -0000

We only have a short description, so set SUMMARY and DESCRIPTION will be
defaulted from it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index ceac4d8..8873105 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
+SUMMARY = "FFmpeg-based GStreamer plug-in"
 SECTION = "multimedia"
 LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
1.8.1.2


