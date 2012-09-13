Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TC7Od-00027G-WB
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 13:15:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2012 04:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,416,1344236400"; d="scan'208";a="144615149"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 04:03:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 12:03:02 +0100
Message-Id: <7b8894230bf22122149c46149cf86422d543234c.1347534093.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347534093.git.paul.eggleton@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347534093.git.paul.eggleton@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] gst-fluendo-mpegdemux: add LICENSE_FLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 11:15:48 -0000

This likely requires some form of license to use in a commercial
product.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-fluendo-mpegdemux_0.10.71.bb     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
index b939eff..580b9e8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "Fluendo closed-format mpeg video GStreamer plug-in"
 LICENSE = "MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
                     file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
+LICENSE_FLAGS = "commercial"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-- 
1.7.9.5



