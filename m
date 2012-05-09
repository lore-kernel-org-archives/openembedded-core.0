Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd2-0005zp-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:40:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721068"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:55 -0700
Message-Id: <1383b470313a3f5810000b16a7aaf4d3ce100428.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/12] h264_qpel_mmx.patch: fix Upstream-Status tag
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 05:40:01 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
index 7891329..ade24dc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
@@ -14,7 +14,7 @@ make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
 
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-status: Backport
+Upstream-Status: Backport
 Index: gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c
 ===================================================================
 --- gst-ffmpeg-0.10.13.orig/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
-- 
1.7.7.6



