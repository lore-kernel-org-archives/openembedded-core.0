Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 462EE6B4F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:52:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2013 07:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,833,1367996400"; d="scan'208";a="377525057"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2013 07:52:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 17:53:48 +0300
Message-Id: <75379b40370d104a4f3ddda7d47b5b382727d02b.1375887108.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375887108.git.cristian.iorga@intel.com>
References: <cover.1375887108.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375887108.git.cristian.iorga@intel.com>
References: <cover.1375887108.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] gst-fluendo-mpegdemux: upgrade to v0.10.72
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
X-List-Received-Date: Wed, 07 Aug 2013 14:52:12 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...luendo-mpegdemux_0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} (70%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
similarity index 70%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
index 580b9e8..f4bdce1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
@@ -8,7 +8,5 @@ LICENSE_FLAGS = "commercial"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-PR = "r0"
-
-SRC_URI[md5sum] = "a7b5152cd73fd0f9fa653fca93c82bd7"
-SRC_URI[sha256sum] = "3be3907e860bce4cc8bee0c70e4b28e91d97f4037e611473b8c9bb954b4de4f9"
+SRC_URI[md5sum] = "df726579404af65b9536428661ab4322"
+SRC_URI[sha256sum] = "a9784bc16352d0fb73de81b9c17142609e8bede46f6d9b881fc3d19673954abf"
-- 
1.8.1.2


