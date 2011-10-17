Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RFnK8-0007Cj-CS
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:33:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Oct 2011 06:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,359,1315206000"; d="scan'208";a="78842663"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.43])
	by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2011 06:27:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 14:27:53 +0100
Message-Id: <c769806dc8d8df66c80934770e3d6e267754fee8.1318852098.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318852098.git.paul.eggleton@linux.intel.com>
References: <cover.1318852098.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1318852098.git.paul.eggleton@linux.intel.com>
References: <cover.1318852098.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] gst-plugins-good: add pulseaudio to DEPENDS
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
X-List-Received-Date: Mon, 17 Oct 2011 13:33:48 -0000

This explicitly enables the pulseaudio plugin rather than it being built
if pulseaudio happens to have been built first.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.28.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
index cca63e9..6c837a7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
-	    speex libsoup-2.4"
-PR = "r1"
+	    speex libsoup-2.4 pulseaudio"
+PR = "r2"
 
 inherit gettext
 
-- 
1.7.4.1



