Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TC7Od-00027G-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 13:15:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2012 04:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,416,1344236400"; d="scan'208";a="144615146"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 04:03:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 12:03:01 +0100
Message-Id: <6ccf7a1f517e37ce7a8467f4a2432b1ae957e837.1347534093.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347534093.git.paul.eggleton@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347534093.git.paul.eggleton@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] gst-ffmpeg: add LICENSE_FLAGS
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
X-List-Received-Date: Thu, 13 Sep 2012 11:15:47 -0000

This likely requires some form of license to use in a commercial
product.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index efab2cf..2107704 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "gstreamer gst-plugins-base zlib bzip2"
 
-- 
1.7.9.5



